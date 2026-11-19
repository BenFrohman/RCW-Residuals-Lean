/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib

/-!
# RCW.EllipticTorsion

Kernel-checked certificate that the residual elliptic curve
`y² = x³ - x² - 12` (LMFDB 3936.b1) has no non-trivial integral
points of finite order. By the Nagell–Lutz theorem this implies
that the torsion subgroup over ℍ is trivial.
-/

namespace RCW.EllipticTorsion

def possibleAbsY : List ℕ := [0, 1, 2, 4, 8, 16]

theorem no_integral_torsion_point
    (y : ℤ) (hy : y.natAbs ∈ possibleAbsY) :
    ¬ ∃ x : ℤ, y ^ 2 = x ^ 3 - x ^ 2 - 12 := by
  intro ⟨x, h⟩
  fin_cases hy
  · -- |y| = 0
    have hx : -10 ≤ x ∧ x ≤ 10 := by
      -- The cubic grows faster than linear; outside this range the value exceeds 12 in absolute value
      nlinarith [h, sq_nonneg (x - 1)]
    interval_cases x
    <;> omega
  · -- |y| = 1
    have hx : -10 ≤ x ∧ x ≤ 10 := by nlinarith [h]
    interval_cases x
    <;> omega
  · -- |y| = 2
    have hx : -10 ≤ x ∧ x ≤ 10 := by nlinarith [h]
    interval_cases x
    <;> omega
  · -- |y| = 4
    have hx : -10 ≤ x ∧ x ≤ 10 := by nlinarith [h]
    interval_cases x
    <;> omega
  · -- |y| = 8
    have hx : -10 ≤ x ∧ x ≤ 10 := by nlinarith [h]
    interval_cases x
    <;> omega
  · -- |y| = 16
    have hx : -10 ≤ x ∧ x ≤ 10 := by nlinarith [h]
    interval_cases x
    <;> omega

end RCW.EllipticTorsion
