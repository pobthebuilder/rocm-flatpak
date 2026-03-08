kind: stack
depends:
- numactl.bst
- rocm-cmake.bst
- rocm-llvm.bst
- rocm-hipcc.bst         # HIPCC
- rocm-device-libs.bst   # ROCm Device Libraries (bitcode)
- rocm-comgr.bst         # ROCm Compiler Manager
- rocr-runtime.bst       # ROCr Runtime - HSA runtime for ROCm
- rocclr.bst
- rocminfo.bst
