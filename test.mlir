//   test_init_f32(memref<*xf32>, index) -> ()
func.func private @test_init_f32(%arg0: memref<*xf32>, %arg1: index) -> ()

//   debug(i32) -> ()
func.func private @debug(%arg0: i32) -> ()

func.func @main() {
  %cn = arith.constant 32768 : index
  %d_a = gpu.alloc (%cn) : memref<?xf32>
  %d_b = gpu.alloc (%cn) : memref<?xf32>
  %d_c = gpu.alloc (%cn) : memref<?xf32>
  %h_a = memref.alloc(%cn) : memref<?xf32>
  %h_b = memref.alloc(%cn) : memref<?xf32>
  %h_c = memref.alloc(%cn) : memref<?xf32>
  %unrank_ha = memref.cast %h_a : memref<?xf32> to memref<*xf32>
  %unrank_hb = memref.cast %h_b : memref<?xf32> to memref<*xf32>
  %unrank_hc = memref.cast %h_c : memref<?xf32> to memref<*xf32>
  func.call @test_init_f32(%unrank_ha, %cn) : (memref<*xf32>, index) -> ()
  func.call @test_init_f32(%unrank_hb, %cn) : (memref<*xf32>, index) -> ()
  func.call @test_init_f32(%unrank_hc, %cn) : (memref<*xf32>, index) -> ()
  gpu.memcpy %d_a, %h_a : memref<?xf32>, memref<?xf32>
  gpu.memcpy %d_b, %h_b : memref<?xf32>, memref<?xf32>
  gpu.memcpy %d_c, %h_c : memref<?xf32>, memref<?xf32>
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %iter = arith.constant 80000 : index
  %dim_sz = arith.constant 128 : index
  %grid_sz = arith.constant 256: index
  scf.for %i = %c0 to %iter step %c1 {
    %i_iter = arith.index_cast %i : index to i32
    func.call @debug(%i_iter) : (i32) -> ()
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%sz_x = %grid_sz, %sz_y = %c1, %sz_z = %c1)
      threads(%arg4, %arg5, %arg6) in (%tx = %dim_sz, %ty = %c1, %tz = %c1) {
      %threadidx = gpu.thread_id  x
      %blockid    = gpu.block_id   x
      %block_off  = arith.muli %blockid, %dim_sz : index
      %thread_off = arith.addi %threadidx, %block_off : index
      %va = memref.load %d_a[%thread_off] : memref<?xf32>
      %vb = memref.load %d_b[%thread_off] : memref<?xf32>
      %vc = memref.load %d_c[%thread_off] : memref<?xf32>
      %sum = arith.addf %va, %vb : f32
      %sum2 = arith.addf %sum, %vc : f32
      memref.store %sum2, %d_c[%thread_off] : memref<?xf32>
      gpu.terminator
    }
  }
  gpu.dealloc %d_a : memref<?xf32>
  gpu.dealloc %d_b : memref<?xf32>
  gpu.dealloc %d_c : memref<?xf32>
  return
}
