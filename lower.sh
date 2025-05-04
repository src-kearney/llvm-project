#!/usr/bin/env bash
set -euo pipefail

MLIR_OPT=./build/bin/mlir-opt

INPUT=test.mlir
OUTPUT=lowered.mlir

$MLIR_OPT $INPUT \
  --gpu-kernel-outlining \
  --gpu-async-region \
  --memref-expand \
  --convert-scf-to-cf \
  --convert-gpu-to-nvvm \
  --convert-index-to-llvm \
  --finalize-memref-to-llvm \
  --convert-arith-to-llvm \
  --convert-cf-to-llvm \
  --convert-func-to-llvm \
  --gpu-to-llvm \
  --reconcile-unrealized-casts \
  -o $OUTPUT

echo "Lowered MLIR written to $OUTPUT"
