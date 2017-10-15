function di(u, v)
    u, v = max(u, v), min(u, v)
    div((u - Cint(1)) * u, Cint(2)) + (v - Cint(1))
end
di(u) = di(u, u)

signz(t) = t < 0 ? -1 : 1

# Apply the Goemens and Williamson randomized cut algorithm to the SDP relaxation of the max-cut problem
function MaxCutRandomized(sdpcone::DSDP.SDPCone, nnodes::Integer)
    ymin = Cdouble(0)

    vv = Vector{Cdouble}(nnodes)
    tt = Vector{Cdouble}(nnodes)
    cc = Vector{Cdouble}(nnodes + 2)
    DSDP.SDPConeComputeXV(sdpcone, 0)
    for i in 1:nnodes
        for j in eachindex(vv)
            dd = rand() - .5
            vv[j] = tan(π * dd)
        end
        DSDP.SDPConeXVMultiply(sdpcone, 0, vv, tt)
        map!(signz, tt, tt)
        map!(zero, cc, cc)
        DSDP.SDPConeAddXVAV(sdpcone, 0, tt, cc)
        if cc[1] < ymin
            ymin = cc[1]
        end
    end
    ymin
end


function maxcut(nnodes, edges)
    nedges = length(edges)
    dsdp = DSDP.Create(nnodes)
    sdpcone = DSDP.CreateSDPCone(dsdp, 1)

    DSDP.SDPConeSetBlockSize(sdpcone, 0, nnodes)

    # Formulate the problem from the data
    # Diagonal elements equal 1.0
    # Create Constraint matrix A_i for i=1, ..., nnodes.
    # that has a single nonzero element.
    diag = ones(Cdouble, nnodes)
    N = Cint(1):Cint(nnodes)
    iptr = di.(N)

    for i in 1:nnodes
        DSDP.SetDualObjective(dsdp, i, 1.0)
        DSDP.SDPConeSetASparseVecMat(sdpcone, 0, i, nnodes, 1.0, 0, pointer(iptr, i), pointer(diag, i), 1)
    end

    # C matrix is the Laplacian of the adjacency matrix
    # Also compute a feasible initial point y such that S >= 0
    yy = zeros(nnodes)
    indd = zeros(Cint, nnodes + nedges)
    val = zeros(nnodes+nedges)
    indd[nedges+(1:nnodes)] = iptr
    tval = 0.0
    for (i, (u, v, w)) in enumerate(edges)
        indd[i] = di(u, v)
        tval += abs(w)
        val[i] = w / 4
        val[nedges+u]-= w/4
        val[nedges+v]-= w/4
        yy[u] -= abs(w/2)
        yy[v] -= abs(w/2)
    end

    DSDP.SDPConeSetASparseVecMat(sdpcone,0,0,nnodes,1.0,0,pointer(indd),pointer(val),nedges)
    DSDP.SDPConeAddASparseVecMat(sdpcone,0,0,nnodes,1.0,0,pointer(indd,nedges+1),pointer(val,nedges+1),nnodes)

    # Initial Point
    DSDP.SetR0(dsdp,0.0)
    DSDP.SetZBar(dsdp,10*tval+1.0)
    for i in 1:nnodes
        DSDP.SetY0(dsdp, i, 10*yy[i])
    end

    # Get read to go
    DSDP.SetGapTolerance(dsdp, 0.001)
    DSDP.SetPotentialParameter(dsdp, 5)
    DSDP.ReuseMatrix(dsdp, 0)
    DSDP.SetPNormTolerance(dsdp, 1.0)
    #info = TCheckArgs(dsdp,argc,argv)

    DSDP.SetStandardMonitor(dsdp,1)

    DSDP.Setup(dsdp)

    DSDP.Solve(dsdp)
    reason = DSDP.StopReason(dsdp)

    @test reason != DSDP.DSDP_INFEASIBLE_START
    @test DSDP.GetDObjective(dsdp) ≈ -9.250079 rtol=1e-7
    @test DSDP.GetDDObjective(dsdp) ≈ -9.250079 rtol=1e-7
    @test DSDP.GetPObjective(dsdp) ≈ 1e10
    @test DSDP.GetPPObjective(dsdp) ≈ -9.240522 rtol=1e-7
    @test DSDP.GetDualityGap(dsdp) ≈ 0.009557113 rtol=1e-7

    # Randomized solution strategy
    @test MaxCutRandomized(sdpcone, nnodes) ≈ -9.25

    DSDP.Destroy(dsdp)
end

@testset "DSDP MaxCut example" begin
    const nnodes = 6
    const edges = [(1, 2,   .3)
                   (1, 4,  2.7)
                   (1, 6,  1.5)
                   (2, 3, -1.0)
                   (2, 5,  1.45)
                   (3, 4, -0.2)
                   (4, 5,  1.2)
                   (5, 6,  2.1)]
    maxcut(nnodes, edges)
end
