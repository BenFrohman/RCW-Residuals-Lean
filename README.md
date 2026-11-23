# RCW-Residuals-Lean

[![Kernel certificate](https://github.com/BenFrohman/RCW-Residuals-Lean/actions/workflows/kernel-certificate.yml/badge.svg?branch=main)](https://github.com/BenFrohman/RCW-Residuals-Lean/actions/workflows/kernel-certificate.yml)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22713135.svg)](https://doi.org/10.5281/zenodo.22713135) [![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

Lean 4 formalization of residual cases for simultaneous totient and divisor-sum jumps of length 12 for the form $n = p^2 q$.

**Concept DOI:** [10.5281/zenodo.22713135](https://doi.org/10.5281/zenodo.22713135)

Copyright (c) 2026 **Benjamin Stanley Frohman**. License: [Apache-2.0](LICENSE).

The residual ledger, including which items are kernel-checked and which are only computational, is in [`docs/RESIDUAL_LEDGER.md`](docs/RESIDUAL_LEDGER.md).

## What is kernel-checked in this repository

- Consecutive-square squeeze in R2: all twist fibres with $1 \le |d| \le (r-3)/2$ are empty (`R2_positive_fiber_no_square`, `R2_negative_fiber_no_square` in `RCW/R2TwistFibers.lean`).
- Nagell–Lutz window check for the residual curve $y^2 = x^3 - x^2 - 12$ (LMFDB 3936.b1): there is no integer $x$ with $y^2 = x^3 - x^2 - 12$ for $|y| \in \{0,1,2,4,8,16\}$, as `no_point_y0`, `no_point_y1`, `no_point_y2`, `no_point_y4`, `no_point_y8`, and `no_point_y16` in `RCW/EllipticTorsion.lean`. This repository does not contain a Lean theorem that states that the torsion subgroup over $\mathbb{Q}$ is trivial; that interpretation uses the classical Nagell–Lutz theorem, which is not formalized here.

Kernel certificates use only standard axioms (`propext`, `Classical.choice`, `Quot.sound`). No `sorry`, no `native_decide`.

## Open residual ledger (not kernel-checked in this repository)

- R2 for $|d| > 499\,997$.
- The R3 small-divisor bound $\lvert d \rvert < \frac{7}{4}r^2 - 2r + 1$, and R3 for large $|d|$. There is no R3 Lean module in this repository.
- Balanced large-prime regime of $\omega(N) \ge 4$.
- $\mathrm{Gal}(R_{10}/\mathbb{Q}) \cong S_{10}$ with explicit discriminant, and non-isotriviality of $E_d$: recorded as paper-level claims, not Lean theorems here.

## Computational surveys (not proofs)

These are cited external computations or planning notes. They are **not** kernel-checked in this repository and are not Lean theorems.

- **Roy Choudhury–Wei, $n \le 10^{12}$.** H. Roy Choudhury and S. Wei, *Prime quadruplets and jump conditions on arithmetic functions*, arXiv:2606.10331v3, 2026, report no counterexample to the simultaneous identities $\varphi(n+12)=\varphi(n)+12$ and $\sigma(n+12)=\sigma(n)+12$ with $n \le 10^{12}$ (166 composite solutions, all of quadruplet type $n=p(p+8)$). In particular, no solution of the form $n=p^2q$ is reported in that range. Source: the p2q-jumps-lean paper abstract, table `tab:bounds` row “all shapes, $n\le 10^{12}$”, and `paper/PROSE-CLAIMS.md` rows 2 and 39 (cited external, RCW 2026).
- **Kernel-checked range in p2q-jumps-lean (separate repository):** $n \le 10^4$ (`Cert.no_jumps_p2q_le_10000`). Provenance: `paper/PROSE-CLAIMS.md` row 41.
- **Cited external PARI search in p2q-jumps-lean:** no solution with $\omega(N)\ge 4$ and $q\le 10^6$, on top of the Lean theorem `omega4_constraints`. Provenance: `paper/PROSE-CLAIMS.md` row 66.
- **Planning note, not a run:** `NOTES/omega4_extension_1e10.md` in p2q-jumps-lean estimates a search to $Q=10^{10}$ at about $3.0\cdot 10^{12}$ pairs. That note states that nothing in it was run, proved, or cited by the paper. It is not an emptiness result.

## Build

```bash
elan toolchain install leanprover/lean4:v4.14.0
lake exe cache get
lake build
```

Pinned toolchain: Lean 4.14.0 + Mathlib v4.14.0. The lock file is `lake-manifest.json`.

## Attribution

Cite as Frohman, *Further constraints on simultaneous totient and divisor-sum jumps of length 12: the form $n=p^2q$*, Zenodo 2026, [10.5281/zenodo.22713135](https://doi.org/10.5281/zenodo.22713135).

---

Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under the Apache License, Version 2.0 (see [LICENSE](LICENSE)).
