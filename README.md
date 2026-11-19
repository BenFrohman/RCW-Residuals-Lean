# RCW-Residuals-Lean

[![Kernel certificate](https://github.com/BenFrohman/RCW-Residuals-Lean/actions/workflows/kernel-certificate.yml/badge.svg?branch=main)](https://github.com/BenFrohman/RCW-Residuals-Lean/actions/workflows/kernel-certificate.yml)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22713135.svg)](https://doi.org/10.5281/zenodo.22713135) [![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

Lean 4 formalization of residual cases for simultaneous totient and divisor-sum jumps of length 12 for the form $n = p^2 q$.

**Concept DOI:** [10.5281/zenodo.22713135](https://doi.org/10.5281/zenodo.22713135)

Copyright (c) 2026 **Benjamin Stanley Frohman**. License: [Apache-2.0](LICENSE).

## What is proved

- Consecutive-square squeeze in R2: all twist fibres with $1 \le |d| \le (r-3)/2$ are empty (`R2_positive_fiber_no_square`, `R2_negative_fiber_no_square`).
- Small-divisor bound in R3.
- Trivial torsion of the residual elliptic curve $y^2 = x^3 - x^2 - 12$ (LMFDB 3936.b1) via Nagell–Lutz finite check (`no_integral_torsion_point_*`).
- $\mathrm{Gal}(R_{10}/\mathbb{Q}) \cong S_{10}$ with explicit discriminant; non-isotrivial elliptic surface $E_d$.

Kernel certificates use only standard axioms (`propext`, `Classical.choice`, `Quot.sound`). No `sorry`, no `native_decide`.

## Open residual ledger

- R2 for $|d| > 499\,997$.
- R3 for large $|d|$.
- Balanced large-prime regime of $\omega(N) \ge 4$.

## Build

```bash
elan toolchain install leanprover/lean4:v4.14.0
lake update
lake exe cache get
lake build
```

Pinned toolchain: Lean 4.14.0 + Mathlib v4.14.0.

## Attribution

Cite as Frohman, *Further constraints on simultaneous totient and divisor-sum jumps of length 12: the form $n=p^2q$*, Zenodo 2026, [10.5281/zenodo.22713135](https://doi.org/10.5281/zenodo.22713135).

---

Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under the Apache License, Version 2.0 (see [LICENSE](LICENSE)).
