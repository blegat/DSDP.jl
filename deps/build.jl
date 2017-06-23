using BinDeps

@BinDeps.setup

@static if is_unix()
    libdsdp = library_dependency("libdsdp", aliases=["libdsdp.a", "libdsdp.so", "libdsdp.dylib"])
end

DSDPname = "DSDP5.8"

provides(Sources, URI("http://www.mcs.anl.gov/hs/software/DSDP/$DSDPname.tar.gz"),
    [libdsdp], os = :Unix, unpacked_dir="$DSDPname")

patchdir=BinDeps.depsdir(libdsdp)
srcdir = joinpath(patchdir,"src",DSDPname) 
libdir = joinpath(srcdir,"lib")
usrdir = BinDeps.usrdir(libdsdp)

provides(SimpleBuild,
    (@build_steps begin
        GetSources(libdsdp)
        CreateDirectory(joinpath(usrdir,"lib"))
        @build_steps begin
            ChangeDirectory(srcdir)
            pipeline(`echo "DSDPROOT=$srcdir"`, stdout="make.include", append=true)
            pipeline(`patch -N -p0`, stdin="$patchdir/malloc.patch")
            pipeline(`patch -N -p0`, stdin="$patchdir/matlab.patch")
            pipeline(`patch -N -p0`, stdin="$patchdir/g2c_1.patch")
            pipeline(`patch -N -p0`, stdin="$patchdir/g2c_2.patch")
            `make`
            `cc -shared $libdir/libdsdp.a -o $usrdir/lib/libdsdp.$(Libdl.dlext)`
        end
    end),[libdsdp], os = :Unix)

@BinDeps.install Dict(:libdsdp => :libdsdp)