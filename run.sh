#!/usr/bin/env bash
set -euo pipefail

MLIR_RUNNER=./build/bin/mlir-cpu-runner
CUDA_RT_LIB=./build/lib/libmlir_cuda_runtime.so

INPUT=lowered.mlir

$MLIR_RUNNER \
  --shared-libs=$CUDA_RT_LIB \
  --entry-point-result=void \
  $INPUT
