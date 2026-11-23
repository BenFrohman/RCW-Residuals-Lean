# Residual ledger

**Repository:** https://github.com/BenFrohman/RCW-Residuals-Lean
**Author:** Benjamin Stanley Frohman
**Concept DOI:** [10.5281/zenodo.22713135](https://doi.org/10.5281/zenodo.22713135)
**Date:** 23 November 2026

This ledger records what is kernel-checked in this repository, what remains open, and which large search bounds are only computational. Nothing in the computational-survey section is a Lean theorem unless a declaration is named below.

## Kernel-checked in this repository

### R2 consecutive-square squeeze (closed in the stated window)

In `RCW/R2TwistFibers.lean`:

- `RCW.R2TwistFibers.R2_positive_fiber_no_square`
- `RCW.R2TwistFibers.R2_negative_fiber_no_square`

These prove that residual R2 has no solutions on any twist fibre with $1 \le |d| \le (r-3)/2$ (with $r \ge 5$). Official `#print axioms` (GitHub Actions run [45270404688](https://github.com/BenFrohman/RCW-Residuals-Lean/actions/runs/45270404688) at commit `8faaa6ed0eb974fa4179f5a357dd8aae5bca390f`):

```
'RCW.R2TwistFibers.R2_negative_fiber_no_square' depends on axioms: [propext, Classical.choice, Quot.sound]
'RCW.R2TwistFibers.R2_positive_fiber_no_square' depends on axioms: [propext, Classical.choice, Quot.sound]
```

### Nagell–Lutz window check for $y^2 = x^3 - x^2 - 12$ (LMFDB 3936.b1)

In `RCW/EllipticTorsion.lean`, the exact statements are:

```lean
theorem no_point_y0 (x : ℤ) (h : 0 = x ^ 3 - x ^ 2 - 12) : False
theorem no_point_y1 (x : ℤ) (h : 1 = x ^ 3 - x ^ 2 - 12) : False
theorem no_point_y2 (x : ℤ) (h : 4 = x ^ 3 - x ^ 2 - 12) : False
theorem no_point_y4 (x : ℤ) (h : 16 = x ^ 3 - x ^ 2 - 12) : False
theorem no_point_y8 (x : ℤ) (h : 64 = x ^ 3 - x ^ 2 - 12) : False
theorem no_point_y16 (x : ℤ) (h : 256 = x ^ 3 - x ^ 2 - 12) : False
```

These show that there is no integer $x$ on the curve for the six Nagell–Lutz candidate values $|y| \in \{0,1,2,4,8,16\}$. There is no declaration in this repository named `no_integral_torsion_point_*`, and there is no Lean theorem that states that the torsion subgroup over $\mathbb{Q}$ is trivial. That interpretation depends on the classical Nagell–Lutz theorem, which is not formalized here.

Official `#print axioms` from the same run:

```
'RCW.EllipticTorsion.no_point_y0' depends on axioms: [propext, Classical.choice, Quot.sound]
'RCW.EllipticTorsion.no_point_y1' depends on axioms: [propext, Classical.choice, Quot.sound]
'RCW.EllipticTorsion.no_point_y16' depends on axioms: [propext, Classical.choice, Quot.sound]
'RCW.EllipticTorsion.no_point_y2' depends on axioms: [propext, Classical.choice, Quot.sound]
'RCW.EllipticTorsion.no_point_y4' depends on axioms: [propext, Classical.choice, Quot.sound]
'RCW.EllipticTorsion.no_point_y8' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Open (not kernel-checked in this repository)

R2 and R3 are open outside any range that is actually proved above.

- R2 for $|d| > 499\,997$ (recorded in `README.md` and `docs/Version15PackageSummary.md`).
- R3 small-divisor bound $\lvert d \rvert < \frac{7}{4}r^2 - 2r + 1$, and R3 for large $|d|$. These bounds appear in `docs/Version15PackageSummary.md`. There is no R3 Lean file in this repository. The filenames `R3AndOmega4Certificates.lean`, `R2ConsecutiveSquareSqueeze.lean`, and `R3JacobianBirational.lean` mentioned in that summary were not found in this repository, on the shared computer, or in the author store.
- Balanced large-prime regime of $\omega(N) \ge 4$.
- $\operatorname{Gal}(R_{10}/\mathbb{Q}) \cong S_{10}$ with explicit discriminant, and non-isotriviality of $E_d$: paper-level claims, not Lean theorems in this repository.

## Computational surveys (not proofs)

### Roy Choudhury–Wei emptiness to $n \le 10^{12}$

This is the large search bound that belongs on the residual ledger and was previously missing from `README.md`.

H. Roy Choudhury and S. Wei, *Prime quadruplets and jump conditions on arithmetic functions*, arXiv:2606.10331v3 [math.NT], 2026, report no counterexample to the simultaneous identities

\[
\varphi(n+12)=\varphi(n)+12, \qquad \sigma(n+12)=\sigma(n)+12
\]

with $n \le 10^{12}$. They record 166 composite solutions in that range, all of quadruplet type $n=p(p+8)$. In particular, no solution of the form $n=p^2q$ is reported up to that bound.

This is a **cited external computational survey, not a kernel-checked theorem**. Provenance:

- p2q-jumps-lean paper abstract (same citation).
- Table `tab:bounds`, row “all shapes, $n\le 10^{12}$”, citing RCW 2026, 0 non-quadruplet hits.
- `paper/PROSE-CLAIMS.md` row 2 and row 39, both marked “cited external (RCW 2026)”.

### Related bounds recorded in p2q-jumps-lean (separate repository)

These are listed here so the residual record is complete. They are not theorems of this repository.

- $n \le 10^4$: kernel-checked in p2q-jumps-lean as `Cert.no_jumps_p2q_le_10000`. Provenance: `paper/PROSE-CLAIMS.md` row 41.
- No solution with $\omega(N)\ge 4$ and $q\le 10^6$: cited external PARI computation, on top of Lean `omega4_constraints`. Provenance: `paper/PROSE-CLAIMS.md` row 66. Not kernel-checked.
- `NOTES/omega4_extension_1e10.md` (16 November 2026 planning note): a proposed search to $Q=10^{10}$ is estimated at about $3.0\cdot 10^{12}$ pairs. The note itself says “Nothing here is run, proved, or cited by the paper.” This figure is a cost estimate for an unrun search, **not** an emptiness result.

### Session figures that could not be sourced

`docs/HandoffSummary-2026-11-19.md` records a filtered modular sieve to $Q=10^5$ with “raw pairs ~409k, survivors ~152k, $\omega\ge 4$ candidates 740.” Those counts were not found in a source file under `/workspace`, `/home`, or the author store, and are not repeated as verified figures here.

---

Copyright (c) 2026 Benjamin Stanley Frohman. Released under Apache-2.0 (see LICENSE).
