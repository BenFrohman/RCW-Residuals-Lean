# RCW Residuals Lean Certificates — Version 1.5 Package

## Kernel certificate

[certificates/CERTIFICATE.md](certificates/CERTIFICATE.md): commit `229153f`, `leanprover/lean4:v4.14.0`. `lake build` passes; the sorry/axiom scan finds 0 hits; **2 theorems depend only on `propext`, `Classical.choice`, `Quot.sound`**; 2 of 2 modules replayed through the kernel, 0 failures ([CI run](https://github.com/BenFrohman/RCW-Residuals-Lean/actions/runs/43937933851)).

**Author:** Benjamin Stanley Frohman  
**Date:** 15 November 2026  
**License:** Apache-2.0  
**Related concept DOI:** [10.5281/zenodo.22713135](https://doi.org/10.5281/zenodo.22713135)

Machine-checked Lean 4 certificates for residual cases in the simultaneous φ/σ jump problem of length 12 for n = p²q.

## Version 1.5 Package Summary

Unconditional eliminations and algebraic invariants are internally consistent and mathematically accurate.

### Unconditional Eliminations
- Consecutive-square squeeze in R2: \(1 \le |d| \le \frac{r-3}{2}\)
- Small-divisor bound in R3: \(|d| < \frac{7}{4}r^2 - 2r + 1\)
- Regimes for \(\omega(N) \ge 4\): q < p and r₁³ q ≤ 215 p⁵

### Algebraic & Galois Invariants
- \(\operatorname{Gal}(R_{10}/\mathbb{Q}) \cong S_{10}\)
- \(\Delta(R_{10}) = -2^{29} \cdot 3^{9} \cdot 7 \cdot 19^{4} \cdot 101^{2} \cdot 14708181153219900133\) (prime cofactor)
- Non-isotrivial elliptic surface \(E_d\)
- Five independent restrictions on d in R2:
  1. \(d \mid \Phi_{16}(r)\)
  2. \(\gcd(d,r)=1\)
  3. cubic congruence modulo r
  4. odd parity lock
  5. consecutive-square exclusion

### Open Residual Ledger
- R2 for \(|d| > 499{,}997\)
- R3 for \(|d| \ge \frac{7}{4}r^2 - 2r + 1\)
- \(\omega(N) \ge 4\) in the balanced large-prime regime

## Contents

- `RCW/R2TwistFibers.lean`: Consecutive-square squeeze eliminating small twist fibers of residual R2 (N = r³s). All fibers with 1 ≤ |d| ≤ (r - 3)/2 are empty. Zero sorry.

## Build

```bash
elan toolchain install leanprover/lean4:v4.14.0
lake update
lake exe cache get
lake build
```

Residual R2 remains open for large |d|. All authorship remains Benjamin Stanley Frohman.
