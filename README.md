# RCW Residuals Lean Certificates

**Author:** Benjamin Stanley Frohman  
**Date:** 15 November 2026  
**License:** Apache-2.0  

Machine-checked Lean 4 certificates for residual cases in the simultaneous φ/σ jump problem of length 12 for n = p²q.

## Contents

- `RCW/R2TwistFibers.lean`: Consecutive-square squeeze eliminating small twist fibers of residual R2 (N = r³s). All fibers with 1 ≤ |d| ≤ (r - 3)/2 are empty.

## Reusability

```bash
elan toolchain install leanprover/lean4:v4.14.0
lake build
```

The file contains zero `sorry`. Residual R2 remains open for large |d|.

Related to concept DOI 10.5281/zenodo.22713135.
