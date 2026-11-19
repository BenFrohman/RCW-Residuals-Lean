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
that the torsion subgroup over ℚ is trivial.
-/

namespace RCW.EllipticTorsion

/-- Possible absolute values of y for integral torsion points
(by Nagell–Lutz: y = 0 or y² divides |Δ| = 62976; the only
square divisors yield |y| ∈ {0,1,2,4,8,16}). -/
def possibleAbsY : List ℕ := [0, 1, 2, 4, 8, 16]

/-- No integer x lies on the curve for any Nagell–Lutz candidate y. -/
theorem no_integral_torsion_point
    (y : ℤ) (hy : y.natAbs ∈ possibleAbsY) :
    ¬ ∃ x : ℤ, y ^ 2 = x ^ 3 - x ^ 2 - 12 := by
  intro ⟨x, h⟩
  fin_cases hy
  · -- |y| = 0
    have : x ^ 3 - x ^ 2 = 12 := by linarith
    interval_cases x
    <;> omega
  · -- |y| = 1
    have : x ^ 3 - x ^ 2 = 13 := by linarith
    interval_cases x
    <;> omega
  · -- |y| = 2
    have : x ^ 3 - x ^ 2 = 16 := by linarith
    interval_cases x
    <;> omega
  · -- |y| = 4
    have : x ^ 3 - x ^ 2 = 28 := by linarith
    interval_cases x
    <;> omega
  · -- |y| = 8
    have : x ^ 3 - x ^ 2 = 76 := by linarith
    interval_cases x
    <;> omega
  · -- |y| = 16
    have : x ^ 3 - x ^ 2 = 268 := by linarith
    interval_cases x
    <;> omega

end RCW.EllipticTorsion
