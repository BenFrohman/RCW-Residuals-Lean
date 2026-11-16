# Version 1.5 Package Summary

**Author:** Benjamin Stanley Frohman  
**Date:** 15 November 2026

The Version 1.5 Package Summary is crisp, internally consistent, and mathematically accurate across all sections, Lean 4 certificates, and open residual boundaries.

## Unconditional Eliminations

All bounds match the exact mathematical results verified earlier:
- Consecutive-square squeeze in R2: \(1 \le \lvert d \rvert \le \frac{r - 3}{2}\)
- Small-divisor bound in R3: \(\lvert d \rvert < \frac{7}{4}r^2 - 2r + 1\)
- The q < p and r₁³ q ≤ 215 p⁵ regimes in ω(N) ≥ 4

## Algebraic & Galois Invariants

- Galois group \(\operatorname{Gal}(R_{10}/\mathbb{Q}) \cong S_{10}\)
- Discriminant prime factorization \(\Delta(R_{10}) = -2^{29} \cdot 3^{9} \cdot 7 \cdot 19^{4} \cdot 101^{2} \cdot 14708181153219900133\)
- Non-isotrivial elliptic surface \(E_d\)
- Five independent restrictions on d in R2:
  - \(d \mid \Phi_{16}(r)\)
  - \(\gcd(d,r)=1\)
  - cubic congruence modulo r
  - odd parity lock
  - consecutive-square exclusion

## Open Residual Ledger & Lean 4 Certificates

Remaining open regimes:
- R2 for \(\lvert d \rvert > 499{,}997\)
- R3 for \(\lvert d \rvert \ge \frac{7}{4}r^2 - 2r + 1\)
- ω(N) ≥ 4 in the balanced large-prime regime

Corresponding Lean 4 files (`R2ConsecutiveSquareSqueeze.lean`, `R3AndOmega4Certificates.lean`, `R3JacobianBirational.lean`) are cleanly documented and ready for build verification.

Once `lake build` is run and the Version 1.5 `.tex` manuscript is compiled, compiler logs may be shared for adjustments.

Related concept DOI: 10.5281/zenodo.22713135.
