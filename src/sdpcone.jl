export SDPCone

module SDPCone

import ..@dsdp_ccall
const SDPConeT = Ptr{Void}

function SetBlockSize(sdpcone::SDPConeT, i::Integer, j::Integer)
    @dsdp_ccall SDPConeSetBlockSize (SDPConeT, Cint, Cint) sdpcone i j
end

function GetBlockSize(sdpcone::SDPConeT, arg2::Integer, arg3)
    @dsdp_ccall SDPConeGetBlockSize (SDPConeT, Cint, Ptr{Cint}) sdpcone arg2 arg3
end

function SetStorageFormat(sdpcone::SDPConeT, arg2::Integer, arg3::UInt8)
    @dsdp_ccall SDPConeSetStorageFormat (SDPConeT, Cint, UInt8) sdpcone arg2 arg3
end

function GetStorageFormat(sdpcone::SDPConeT, arg2::Integer, arg3)
    @dsdp_ccall SDPConeGetStorageFormat (SDPConeT, Cint, Cstring) sdpcone arg2 arg3
end

function CheckStorageFormat(sdpcone::SDPConeT, arg2::Integer, arg3::UInt8)
    @dsdp_ccall SDPConeCheckStorageFormat (SDPConeT, Cint, UInt8) sdpcone arg2 arg3
end

function SetSparsity(sdpcone::SDPConeT, arg2::Integer, arg3::Integer)
    @dsdp_ccall SDPConeSetSparsity (SDPConeT, Cint, Cint) sdpcone arg2 arg3
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

function SetASparseVecMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5::Cdouble, arg6::Integer, arg7, arg8, arg9::Integer)
    @dsdp_ccall SDPConeSetASparseVecMat (SDPConeT, Cint, Cint, Cint, Cdouble, Cint, Ptr{Cint}, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
end

function SetADenseVecMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5::Cdouble, arg6, arg7::Integer)
    @dsdp_ccall SDPConeSetADenseVecMat (SDPConeT, Cint, Cint, Cint, Cdouble, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5 arg6 arg7
end

function SetARankOneMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5::Cdouble, arg6::Integer, arg7, arg8, arg9::Integer)
    @dsdp_ccall SDPConeSetARankOneMat (SDPConeT, Cint, Cint, Cint, Cdouble, Cint, Ptr{Cint}, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
end

function SetConstantMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5::Cdouble)
    @dsdp_ccall SDPConeSetConstantMat (SDPConeT, Cint, Cint, Cint, Cdouble) sdpcone arg2 arg3 arg4 arg5
end

function SetZeroMat(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer)
    @dsdp_ccall SDPConeSetZeroMat (SDPConeT, Cint, Cint, Cint) sdpcone arg2 arg3 arg4
end

function SetIdentity(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4::Integer, arg5::Cdouble)
    @dsdp_ccall SDPConeSetIdentity (SDPConeT, Cint, Cint, Cint, Cdouble) sdpcone arg2 arg3 arg4 arg5
end

function ViewDataMatrix(sdpcone::SDPConeT, arg2::Integer, arg3::Integer)
    @dsdp_ccall SDPConeViewDataMatrix (SDPConeT, Cint, Cint) sdpcone arg2 arg3
end

function MatrixView(sdpcone::SDPConeT, arg2::Integer)
    @dsdp_ccall SDPConeMatrixView (SDPConeT, Cint) sdpcone arg2
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

function ViewX(sdpcone::SDPConeT, arg2::Integer, arg3::Integer, arg4, arg5::Integer)
    @dsdp_ccall SDPConeViewX (SDPConeT, Cint, Cint, Ptr{Cdouble}, Cint) sdpcone arg2 arg3 arg4 arg5
end

function SetLanczosIterations(sdpcone::SDPConeT, arg2::Integer)
    @dsdp_ccall SDPConeSetLanczosIterations (SDPConeT, Cint) sdpcone arg2
end

function ScaleBarrier(sdpcone::SDPConeT, arg2::Integer, arg3::Cdouble)
    @dsdp_ccall SDPConeScaleBarrier (SDPConeT, Cint, Cdouble) sdpcone arg2 arg3
end

function XVMultiply(sdpcone::SDPConeT, arg2::Integer, arg3::Vector, arg4::Vector)
    n = length(arg3)
    @assert n == length(arg4)
    @dsdp_ccall SDPConeXVMultiply (SDPConeT, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Cint) sdpcone arg2 pointer(arg3) pointer(arg4) n
end

function ComputeXV(sdpcone::SDPConeT, arg2::Integer)
    derror = Ref{Cint}()
    @dsdp_ccall SDPConeComputeXV (SDPConeT, Cint, Ref{Cint}) sdpcone arg2 derror
    derror[]
end

function AddXVAV(sdpcone::SDPConeT, arg2::Integer, arg3::Vector, arg5::Vector)
    @dsdp_ccall SDPConeAddXVAV (SDPConeT, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Cint) sdpcone arg2 pointer(arg3) length(arg3) pointer(arg5) length(arg5)
end

function UseLAPACKForDualMatrix(sdpcone::SDPConeT, arg2::Integer)
    @dsdp_ccall SDPConeUseLAPACKForDualMatrix (SDPConeT, Cint) sdpcone arg2
end

function UseFullSymmetricFormat(sdpcone::SDPConeT, arg2::Integer)
    @dsdp_ccall SDPConeUseFullSymmetricFormat (SDPConeT, Cint) sdpcone arg2
end

function UsePackedFormat(sdpcone::SDPConeT, arg2::Integer)
    @dsdp_ccall SDPConeUsePackedFormat (SDPConeT, Cint) sdpcone arg2
end

end
