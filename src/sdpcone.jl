export SDPCone

module SDPCone

import ..@dsdp_ccall
const SDPConeT = Ptr{Void}

function SetBlockSize(sdpcone::SDPConeT, blockj::Integer, n::Integer)
    @dsdp_ccall SDPConeSetBlockSize (SDPConeT, Cint, Cint) sdpcone blockj n
end

function GetBlockSize(sdpcone::SDPConeT, blockj::Integer)
    n = Ref{Cint}()
    @dsdp_ccall SDPConeGetBlockSize (SDPConeT, Cint, Ref{Cint}) sdpcone blockj n
    n[]
end

function SetStorageFormat(sdpcone::SDPConeT, blockj::Integer, format)
    @dsdp_ccall SDPConeSetStorageFormat (SDPConeT, Cint, Cchar) sdpcone blockj format
end

function GetStorageFormat(sdpcone::SDPConeT, blockj::Integer)
    format = Ref{Cchar}()
    @dsdp_ccall SDPConeGetStorageFormat (SDPConeT, Cint, Ref{Cchar}) sdpcone blockj format
    format[]
end

function CheckStorageFormat(sdpcone::SDPConeT, blockj::Integer, format)
    @dsdp_ccall SDPConeCheckStorageFormat (SDPConeT, Cint, Cchar) sdpcone blockj format
end

function SetSparsity(sdpcone::SDPConeT, blockj::Integer, nnz::Integer)
    @dsdp_ccall SDPConeSetSparsity (SDPConeT, Cint, Cint) sdpcone blockj nnz
end

function View(sdpcone::SDPConeT)
    @dsdp_ccall SDPConeView (SDPConeT,) sdpcone
end

function View2(sdpcone::SDPConeT)
    @dsdp_ccall SDPConeView2 (SDPConeT,) sdpcone
end

function View3(sdpcone::SDPConeT)
    @dsdp_ccall SDPConeView3 (SDPConeT,) sdpcone
end

function SetASparseVecMat(sdpcone::SDPConeT, blockj::Integer, vari::Integer, n::Integer, α::AbstractFloat, ishift::Integer, ind::Vector{Cint}, val::Vector{Cdouble})
    SetASparseVecMat(sdpcone, blockj, vari, n, α, ishift, pointer(ind), pointer(val), length2(ind, val))
end
function SetASparseVecMat(sdpcone::SDPConeT, blockj::Integer, vari::Integer, n::Integer, α::AbstractFloat, ishift::Integer, ind::Ptr{Cint}, val::Ptr{Cdouble}, nnz::Integer)
    @dsdp_ccall SDPConeSetASparseVecMat (SDPConeT, Cint, Cint, Cint, Cdouble, Cint, Ptr{Cint}, Ptr{Cdouble}, Cint) sdpcone blockj vari n α ishift ind val nnz
end

function SetADenseVecMat(sdpcone::SDPConeT, blockj::Integer, vari::Integer, n::Integer, α::AbstractFloat, val::Vector{Cdouble})
    @dsdp_ccall SDPConeSetADenseVecMat (SDPConeT, Cint, Cint, Cint, Cdouble, Ptr{Cdouble}, Cint) sdpcone blockj vari n α pointer(val) length(val)
end

function SetARankOneMat(sdpcone::SDPConeT, blockj::Integer, vari::Integer, n::Integer, α::AbstractFloat, ishift::Integer, ind::Vector{Cint}, val::Vector{Cdouble})
    @dsdp_ccall SDPConeSetARankOneMat (SDPConeT, Cint, Cint, Cint, Cdouble, Cint, Ptr{Cint}, Ptr{Cdouble}, Cint) sdpcone blockj vari n α ishift pointer(ind) pointer(val) length2(ind, val)
end

function SetConstantMat(sdpcone::SDPConeT, blockj::Integer, vari::Integer, n::Integer, value::AbstractFloat)
    @dsdp_ccall SDPConeSetConstantMat (SDPConeT, Cint, Cint, Cint, Cdouble) sdpcone blockj vari n value
end

function SetZeroMat(sdpcone::SDPConeT, blockj::Integer, vari::Integer, n::Integer)
    @dsdp_ccall SDPConeSetZeroMat (SDPConeT, Cint, Cint, Cint) sdpcone blockj vari n
end

function SetIdentity(sdpcone::SDPConeT, blockj::Integer, vari::Integer, n::Integer, val::AbstractFloat)
    @dsdp_ccall SDPConeSetIdentity (SDPConeT, Cint, Cint, Cint, Cdouble) sdpcone blockj vari n val
end

function ViewDataMatrix(sdpcone::SDPConeT, blockj::Integer, vari::Integer)
    @dsdp_ccall SDPConeViewDataMatrix (SDPConeT, Cint, Cint) sdpcone blockj vari
end

function MatrixView(sdpcone::SDPConeT, blockj::Integer)
    @dsdp_ccall SDPConeMatrixView (SDPConeT, Cint) sdpcone blockj
end

function AddASparseVecMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5::Cdouble, arg6::Integer, arg7, arg8, arg9::Integer)
    @dsdp_ccall SDPConeAddASparseVecMat (SDPConeT, Cint, Cint, Cint, Cdouble, Cint, Ptr{Cint}, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
end

function AddADenseVecMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5::Cdouble, arg6, arg7::Integer)
    @dsdp_ccall SDPConeAddADenseVecMat (SDPConeT, Cint, Cint, Cint, Cdouble, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5 arg6 arg7
end

function AddConstantMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5::Cdouble)
    @dsdp_ccall SDPConeAddConstantMat (SDPConeT, Cint, Cint, Cint, Cdouble) sdpcone arg2 arg3 arg4 arg5
end

function AddIdentity(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5::Cdouble)
    @dsdp_ccall SDPConeAddIdentity (SDPConeT, Cint, Cint, Cint, Cdouble) sdpcone arg2 arg3 arg4 arg5
end

function AddARankOneMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5::Cdouble, arg6::Integer, arg7, arg8, arg9::Integer)
    @dsdp_ccall SDPConeAddARankOneMat (SDPConeT, Cint, Cint, Cint, Cdouble, Cint, Ptr{Cint}, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
end

function AddSparseVecMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5::Integer, arg6, arg7, arg8::Integer)
    @dsdp_ccall SDPConeAddSparseVecMat (SDPConeT, Cint, Cint, Cint, Cint, Ptr{Cint}, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5 arg6 arg7 arg8
end

function AddDenseVecMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5, arg6::Integer)
    @dsdp_ccall SDPConeAddDenseVecMat (SDPConeT, Cint, Cint, Cint, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5 arg6
end

function SetSparseVecMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5::Integer, arg6, arg7, arg8::Integer)
    @dsdp_ccall SDPConeSetSparseVecMat (SDPConeT, Cint, Cint, Cint, Cint, Ptr{Cint}, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5 arg6 arg7 arg8
end

function SetDenseVecMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5, arg6::Integer)
    @dsdp_ccall SDPConeSetDenseVecMat (SDPConeT, Cint, Cint, Cint, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5 arg6
end

function SetXMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer)
    @dsdp_ccall SDPConeSetXMat (SDPConeT, Cint, Cint) sdpcone arg2 arg3
end

function SetXArray(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4, arg5::Integer)
    @dsdp_ccall SDPConeSetXArray (SDPConeT, Cint, Cint, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5
end

function GetXArray(sdpcone::SDPConeT, arg2::Integer, arg3, arg4)
    @dsdp_ccall SDPConeGetXArray (SDPConeT, Cint, Ptr{Ptr{Cdouble}}, Ptr{Cint}) sdpcone arg2 arg3 arg4
end

function RestoreXArray(sdpcone::SDPConeT, arg2::Integer, arg3, arg4)
    @dsdp_ccall SDPConeRestoreXArray (SDPConeT, Cint, Ptr{Ptr{Cdouble}}, Ptr{Cint}) sdpcone arg2 arg3 arg4
end

function CheckData(sdpcone::SDPConeT)
    @dsdp_ccall SDPConeCheckData (SDPConeT,) sdpcone
end

function RemoveDataMatrix(sdpcone::SDPConeT, arg2::Integer, arg3::Integer)
    @dsdp_ccall SDPConeRemoveDataMatrix (SDPConeT, Cint, Cint) sdpcone arg2 arg3
end

function GetNumberOfBlocks(sdpcone::SDPConeT, arg2)
    @dsdp_ccall SDPConeGetNumberOfBlocks (SDPConeT, Ptr{Cint}) sdpcone arg2
end

function ComputeS(sdpcone::SDPConeT, arg2::Integer, arg3::Cdouble, arg4, arg5::Integer, arg6::Cdouble, arg7::Integer, arg8, arg9::Integer)
    @dsdp_ccall SDPConeComputeS (SDPConeT, Cint, Cdouble, Ptr{Cdouble}, Cint, Cdouble, Cint, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
end

function ComputeX(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4, arg5::Integer)
    @dsdp_ccall SDPConeComputeX (SDPConeT, Cint, Cint, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5
end

function AddADotX(sdpcone::SDPConeT, arg2::Integer, arg3::Cdouble, arg4, arg5::Integer, arg6, arg7::Integer)
    @dsdp_ccall SDPConeAddADotX (SDPConeT, Cint, Cdouble, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5 arg6 arg7
end

function ViewX(sdpcone::SDPConeT, blockj::Integer, n::Integer, x::Vector{Cdouble})
    @dsdp_ccall SDPConeViewX (SDPConeT, Cint, Cint, Ptr{Cdouble}, Cint) sdpcone blockj n pointer(x) length(x)
end

function SetLanczosIterations(sdpcone::SDPConeT, itmp::Integer)
    @dsdp_ccall SDPConeSetLanczosIterations (SDPConeT, Cint) sdpcone itmp
end

function ScaleBarrier(sdpcone::SDPConeT, blockj::Integer, gγ::AbstractFloat)
    @dsdp_ccall SDPConeScaleBarrier (SDPConeT, Cint, Cdouble) sdpcone blockj gγ
end

function XVMultiply(sdpcone::SDPConeT, blockj::Integer, vin::Vector, vout::Vector)
    @dsdp_ccall SDPConeXVMultiply (SDPConeT, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Cint) sdpcone blockj pointer(vin) pointer(vout) length2(vin, vout)
end

function ComputeXV(sdpcone::SDPConeT, blockj::Integer)
    derror = Ref{Cint}()
    @dsdp_ccall SDPConeComputeXV (SDPConeT, Cint, Ref{Cint}) sdpcone blockj derror
    derror[]
end

function AddXVAV(sdpcone::SDPConeT, blockj::Integer, vin::Vector, sum::Vector)
    @dsdp_ccall SDPConeAddXVAV (SDPConeT, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Cint) sdpcone blockj pointer(vin) length(vin) pointer(sum) length2(vin, sum)
end

function UseLAPACKForDualMatrix(sdpcone::SDPConeT, flag::Integer)
    @dsdp_ccall SDPConeUseLAPACKForDualMatrix (SDPConeT, Cint) sdpcone arg2
end

function UseFullSymmetricFormat(sdpcone::SDPConeT, blockj::Integer)
    @dsdp_ccall SDPConeUseFullSymmetricFormat (SDPConeT, Cint) sdpcone blockj
end

function UsePackedFormat(sdpcone::SDPConeT, blockj::Integer)
    @dsdp_ccall SDPConeUsePackedFormat (SDPConeT, Cint) sdpcone blockj
end

end
