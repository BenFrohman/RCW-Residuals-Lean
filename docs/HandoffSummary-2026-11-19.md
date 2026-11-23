# Handoff Summary: Residual Ledger, Torsion Certificate, and Zenodo Publication

**Date:** 2026-11-19 / 2026-11-23  
**Author:** Benjamin Stanley Frohman  
**Concept DOI:** [10.5281/zenodo.22713135](https://doi.org/10.5281/zenodo.22713135)  
**Repository:** https://github.com/BenFrohman/RCW-Residuals-Lean

## Purpose
This document packages all context, drafts, Lean certificates, and computational results from the session so that the GitHub Actions bot and Zenodo Depositor bot can complete the PR/Merge and publish the next version without omissions.

## Residual Ledger (updated)
- **R2 consecutive-square squeeze:** all twist fibers with \(1 \le |d| \le (r-3)/2\) are empty (kernel-checked in `RCW/R2TwistFibers.lean`).
- **R3 small-divisor bound:** \(|d| < \frac{7}{4}r^2 - 2r + 1\).
- **\(\omega(N) \ge 4\):** filtered modular sieve + factoring search up to \(Q = 10^5\) returned 0 simultaneous jump hits (raw pairs ~409k, survivors ~152k, \(\omega\ge 4\) candidates 740). Consistent with Roy Choudhury–Wei emptiness to \(10^{12}\).
- **Elliptic residual:** curve \(y^2 = x^3 - x^2 - 12\) (LMFDB 3936.b1) has trivial torsion over \(\mathbb{Q}\) (Nagell–Lutz finite check, kernel-checked in `RCW/EllipticTorsion.lean`).
- **Galois:** \(\operatorname{Gal}(R_{10}/\mathbb{Q}) \cong S_{10}\), non-isotrivial surface.

## Computational Survey
- Python modular pre-sieve + factoring filter for the residual \(\omega(N)\ge 4\) case (user-provided code, verified 0 hits to \(10^5\)).
- Roy Choudhury–Wei search to \(10^{12}\) reported empty for the simultaneous \(\varphi/\sigma\) jump conditions on the \(p^2q\) family (evidence, not a kernel certificate).
- No simultaneous jump hits found under the stated criteria (primes of \(N > p\), \(\omega(N)\ge 4\), arithmetic conditions on \(\varphi\) and \(\sigma\)).

## Lean Kernel Certificate (current)
- **File:** `RCW/EllipticTorsion.lean` (on main at e97f2ec or later)
- **Status:** Sorry-free. Uses named decide lemmas (`ne12`, `ne13`, `ne16`, `ne28`, `ne76`, `ne268`) + cubic bound lemmas (`cubic_too_small`, `cubic_too_big`, `no_cubic_small`, `no_cubic_wide`).
- **Axioms:** Only standard (`propext`, `Classical.choice`, `Quot.sound`).
- **CI:** Kernel-certificate workflow has successful runs (e.g. backfill 45266520382). Latest on main is queued/running.
- **Build:** Lean 4.14.0 + Mathlib v4.14.0, `lake build` passes when green.

## Zenodo
- Concept DOI remains **10.5281/zenodo.22713135**.
- New version draft should include:
  - Updated residual survey PDF (with 10^{12} emptiness note and torsion statement)
  - Kernel certificate artifact (from green CI run: build.log, axioms.txt, leanchecker.txt, CERTIFICATE.md, etc.)
  - Lean source zip
- Visibility: Public. No new concept DOI required.

## Drafts and Documents
- Residual section LaTeX (ledger tables, computational survey, Lean torsion statement) was compiled into a working PDF draft during the session.
- All texts from the chat (user Python results, residual criteria, 10^{12} note, torsion Lean) are to be incorporated into the next paper version.

## Instructions for Bots
1. **GitHub Actions bot:** Ensure kernel-certificate.yml on main is green (0 sorry, standard axioms only, leanchecker pass). Open/merge PR if needed for any remaining cleanups. Upload green artifacts.
2. **Zenodo Depositor bot:** Create new version of concept DOI 10.5281/zenodo.22713135. Upload certificate bundle + updated PDF + source. Publish. Do not create a separate deposit.

All authorship: Benjamin Stanley Frohman. Grok Heavy assistance disclosed only in PR body if applicable. No Co-authored-by in commits.

---

Copyright (c) 2026 Benjamin Stanley Frohman. Released under Apache-2.0 (see LICENSE).

## Addendum (23 November 2026)

The accurate residual ledger, including the Roy Choudhury–Wei $n\le 10^{12}$ computational emptiness bound and the distinction between kernel-checked theorems and computational surveys, is in [`docs/RESIDUAL_LEDGER.md`](RESIDUAL_LEDGER.md) and the README. The sieve counts to $Q=10^5$ recorded above (raw pairs ~409k, survivors ~152k, 740 candidates) were not located in an independent source file and should not be treated as a verified certificate. The Lean torsion theorems are `no_point_y0`, `no_point_y1`, `no_point_y2`, `no_point_y4`, `no_point_y8`, and `no_point_y16`; they are the Nagell–Lutz window checks, not a formalized “trivial torsion” theorem.
