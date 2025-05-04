module attributes {gpu.container_module} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @test_init_f32(i64, !llvm.ptr, i64) attributes {sym_visibility = "private"}
  llvm.func @debug(i32) attributes {sym_visibility = "private"}
  llvm.func @main() {
    %0 = llvm.mlir.constant(256 : index) : i64
    %1 = llvm.mlir.constant(128 : index) : i64
    %2 = llvm.mlir.constant(80000 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %5 = llvm.mlir.zero : !llvm.ptr
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.mlir.constant(32768 : index) : i64
    %8 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %9 = llvm.mlir.constant(1 : index) : i64
    %10 = llvm.mlir.zero : !llvm.ptr
    %11 = llvm.getelementptr %10[%7] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %12 = llvm.ptrtoint %11 : !llvm.ptr to i64
    %13 = llvm.mlir.zero : !llvm.ptr
    %14 = llvm.mlir.constant(0 : i8) : i8
    %15 = llvm.call @mgpuMemAlloc(%12, %8, %14) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %16 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %17 = llvm.insertvalue %15, %16[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.insertvalue %15, %17[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %19 = llvm.mlir.constant(0 : index) : i64
    %20 = llvm.insertvalue %19, %18[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.insertvalue %7, %20[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.insertvalue %9, %21[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %23 = llvm.mlir.constant(1 : index) : i64
    %24 = llvm.mlir.zero : !llvm.ptr
    %25 = llvm.getelementptr %24[%7] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %26 = llvm.ptrtoint %25 : !llvm.ptr to i64
    %27 = llvm.mlir.zero : !llvm.ptr
    %28 = llvm.mlir.constant(0 : i8) : i8
    %29 = llvm.call @mgpuMemAlloc(%26, %8, %28) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %30 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %31 = llvm.insertvalue %29, %30[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %32 = llvm.insertvalue %29, %31[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %33 = llvm.mlir.constant(0 : index) : i64
    %34 = llvm.insertvalue %33, %32[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %35 = llvm.insertvalue %7, %34[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.insertvalue %23, %35[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.mlir.constant(1 : index) : i64
    %38 = llvm.mlir.zero : !llvm.ptr
    %39 = llvm.getelementptr %38[%7] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %40 = llvm.ptrtoint %39 : !llvm.ptr to i64
    %41 = llvm.mlir.zero : !llvm.ptr
    %42 = llvm.mlir.constant(0 : i8) : i8
    %43 = llvm.call @mgpuMemAlloc(%40, %8, %42) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %44 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %45 = llvm.insertvalue %43, %44[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %46 = llvm.insertvalue %43, %45[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %47 = llvm.mlir.constant(0 : index) : i64
    %48 = llvm.insertvalue %47, %46[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %49 = llvm.insertvalue %7, %48[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %50 = llvm.insertvalue %37, %49[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuStreamSynchronize(%8) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%8) : (!llvm.ptr) -> ()
    %51 = llvm.getelementptr %5[32768] : (!llvm.ptr) -> !llvm.ptr, f32
    %52 = llvm.ptrtoint %51 : !llvm.ptr to i64
    %53 = llvm.call @malloc(%52) : (i64) -> !llvm.ptr
    %54 = llvm.insertvalue %53, %4[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %55 = llvm.insertvalue %53, %54[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %56 = llvm.insertvalue %3, %55[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %57 = llvm.insertvalue %7, %56[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %58 = llvm.insertvalue %6, %57[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %59 = llvm.getelementptr %5[32768] : (!llvm.ptr) -> !llvm.ptr, f32
    %60 = llvm.ptrtoint %59 : !llvm.ptr to i64
    %61 = llvm.call @malloc(%60) : (i64) -> !llvm.ptr
    %62 = llvm.insertvalue %61, %4[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %63 = llvm.insertvalue %61, %62[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %64 = llvm.insertvalue %3, %63[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %65 = llvm.insertvalue %7, %64[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %66 = llvm.insertvalue %6, %65[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %67 = llvm.getelementptr %5[32768] : (!llvm.ptr) -> !llvm.ptr, f32
    %68 = llvm.ptrtoint %67 : !llvm.ptr to i64
    %69 = llvm.call @malloc(%68) : (i64) -> !llvm.ptr
    %70 = llvm.insertvalue %69, %4[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %71 = llvm.insertvalue %69, %70[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %72 = llvm.insertvalue %3, %71[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %73 = llvm.insertvalue %7, %72[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %74 = llvm.insertvalue %6, %73[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %75 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %58, %75 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %76 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %66, %76 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %77 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %74, %77 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    llvm.call @test_init_f32(%6, %75, %7) : (i64, !llvm.ptr, i64) -> ()
    llvm.call @test_init_f32(%6, %76, %7) : (i64, !llvm.ptr, i64) -> ()
    llvm.call @test_init_f32(%6, %77, %7) : (i64, !llvm.ptr, i64) -> ()
    %78 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %79 = llvm.extractvalue %58[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %80 = llvm.mlir.zero : !llvm.ptr
    %81 = llvm.getelementptr %80[%79] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %82 = llvm.ptrtoint %81 : !llvm.ptr to i64
    %83 = llvm.extractvalue %58[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %84 = llvm.extractvalue %22[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%84, %83, %82, %78) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %85 = llvm.extractvalue %66[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %86 = llvm.mlir.zero : !llvm.ptr
    %87 = llvm.getelementptr %86[%85] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %88 = llvm.ptrtoint %87 : !llvm.ptr to i64
    %89 = llvm.extractvalue %66[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %90 = llvm.extractvalue %36[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%90, %89, %88, %78) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %91 = llvm.extractvalue %74[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %92 = llvm.mlir.zero : !llvm.ptr
    %93 = llvm.getelementptr %92[%91] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %94 = llvm.ptrtoint %93 : !llvm.ptr to i64
    %95 = llvm.extractvalue %74[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %96 = llvm.extractvalue %50[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%96, %95, %94, %78) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%78) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%78) : (!llvm.ptr) -> ()
    llvm.br ^bb1(%3 : i64)
  ^bb1(%97: i64):  // 2 preds: ^bb0, ^bb2
    %98 = llvm.icmp "slt" %97, %2 : i64
    llvm.cond_br %98, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %99 = llvm.trunc %97 : i64 to i32
    llvm.call @debug(%99) : (i32) -> ()
    %100 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %101 = llvm.extractvalue %22[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %102 = llvm.extractvalue %22[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %103 = llvm.extractvalue %22[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %104 = llvm.extractvalue %22[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %105 = llvm.extractvalue %22[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %106 = llvm.extractvalue %36[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %107 = llvm.extractvalue %36[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %108 = llvm.extractvalue %36[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %109 = llvm.extractvalue %36[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %110 = llvm.extractvalue %36[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %111 = llvm.extractvalue %50[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %112 = llvm.extractvalue %50[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %113 = llvm.extractvalue %50[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %114 = llvm.extractvalue %50[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %115 = llvm.extractvalue %50[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    gpu.launch_func <%100 : !llvm.ptr> @main_kernel::@main_kernel blocks in (%0, %6, %6) threads in (%1, %6, %6) : i64 args(%1 : i64, %101 : !llvm.ptr, %102 : !llvm.ptr, %103 : i64, %104 : i64, %105 : i64, %106 : !llvm.ptr, %107 : !llvm.ptr, %108 : i64, %109 : i64, %110 : i64, %111 : !llvm.ptr, %112 : !llvm.ptr, %113 : i64, %114 : i64, %115 : i64)
    llvm.call @mgpuStreamSynchronize(%100) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%100) : (!llvm.ptr) -> ()
    %116 = llvm.add %97, %6 : i64
    llvm.br ^bb1(%116 : i64)
  ^bb3:  // pred: ^bb1
    %117 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %118 = llvm.extractvalue %22[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%118, %117) : (!llvm.ptr, !llvm.ptr) -> ()
    %119 = llvm.extractvalue %36[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%119, %117) : (!llvm.ptr, !llvm.ptr) -> ()
    %120 = llvm.extractvalue %50[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%120, %117) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%117) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%117) : (!llvm.ptr) -> ()
    llvm.return
  }
  gpu.module @main_kernel {
    llvm.func @main_kernel(%arg0: i64, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: !llvm.ptr, %arg12: !llvm.ptr, %arg13: i64, %arg14: i64, %arg15: i64) attributes {gpu.kernel, gpu.known_block_size = array<i32: 128, 1, 1>, gpu.known_grid_size = array<i32: 256, 1, 1>, nvvm.kernel, nvvm.maxntid = array<i32: 128, 1, 1>} {
      %0 = nvvm.read.ptx.sreg.tid.x range <i32, 0, 128> : i32
      %1 = llvm.sext %0 : i32 to i64
      %2 = nvvm.read.ptx.sreg.ctaid.x range <i32, 0, 256> : i32
      %3 = llvm.sext %2 : i32 to i64
      %4 = llvm.mul %3, %arg0 : i64
      %5 = llvm.add %1, %4 : i64
      %6 = llvm.getelementptr %arg2[%5] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      %7 = llvm.load %6 : !llvm.ptr -> f32
      %8 = llvm.getelementptr %arg7[%5] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      %9 = llvm.load %8 : !llvm.ptr -> f32
      %10 = llvm.getelementptr %arg12[%5] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      %11 = llvm.load %10 : !llvm.ptr -> f32
      %12 = llvm.fadd %7, %9 : f32
      %13 = llvm.fadd %12, %11 : f32
      %14 = llvm.getelementptr %arg12[%5] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      llvm.store %13, %14 : f32, !llvm.ptr
      llvm.return
    }
  }
  llvm.func @mgpuStreamCreate() -> !llvm.ptr
  llvm.func @mgpuMemAlloc(i64, !llvm.ptr, i8) -> !llvm.ptr
  llvm.func @mgpuStreamSynchronize(!llvm.ptr)
  llvm.func @mgpuStreamDestroy(!llvm.ptr)
  llvm.func @mgpuMemcpy(!llvm.ptr, !llvm.ptr, i64, !llvm.ptr)
  llvm.func @mgpuMemFree(!llvm.ptr, !llvm.ptr)
}

