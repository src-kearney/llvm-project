#!/usr/bin/env bash
set -euo pipefail

BUILD_DIR=build
MLIR_OPT=$BUILD_DIR/bin/mlir-opt
MLIR_RUNNER=$BUILD_DIR/bin/mlir-runner

$MLIR_OPT test.mlir \
  --pass-pipeline='gpu-kernel-outlining,gpu-lower-to-nvvm-pipeline' \
  -o gpu_lowered.mlir

$MLIR_OPT gpu_lowered.mlir \
  --pass-pipeline='builtin.module(func.func(gpu-async-region,memref-expand,convert-index-to-llvm,finalize-memref-to-llvm,convert-arith-to-llvm,convert-cf-to-llvm,convert-func-to-llvm,gpu-to-llvm,reconcile-unrealized-casts))' \
  -o lowered.mlir

grep unrealized_conversion_cast lowered.mlir || echo OK

$MLIR_RUNNER \
  -e main --entry-point-result=void \
  --shared-libs=$BUILD_DIR/lib/libmlir_cuda_runtime.so \
  --shared-libs=$BUILD_DIR/lib/libmlir_runner_utils.so \
  lowered.mlir
