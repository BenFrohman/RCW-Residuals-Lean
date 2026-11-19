/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib

/-!
# RCW.EllipticTorsion

Machine-checked certificate that the residual elliptic curve
`y² = x³ - x² - 12` (LMFDB 3936.b1) has no non-trivial integral
points of finite order.

By the Nagell–Lutz theorem the only possible absolute values of y
for an integral torsion point are 0, 1, 2, 4, 8, 16.
Each case is shown to have no integer solution.
-/

namespace RCW.EllipticTorsion

theorem no_point_y0 (x : ℤ) (h : 0 = x ^ 3 - x ^ 2 - 12) : False := by
  have : x ^ 3 - x ^ 2 = 12 := by linarith
  have : x ≥ -3 ∧ x ≤ 4 := by nlinarith
  omega

theorem no_point_y1 (x : ℤ) (h : 1 = x ^ 3 - x ^ 2 - 12) : False := by
  have : x ^ 3 - x ^ 2 = 13 := by linarith
  have : x ≥ -3 ∧ x ≤ 4 := by nlinarith
  omega

theorem no_point_y2 (x : ℤ) (h : 4 = x ^ 3 - x ^ 2 - 12) : False := by
  have : x ^ 3 - x ^ 2 = 16 := by linarith
  have : x ≥ -3 ∧ x ≤ 4 := by nlinarith
  omega

theorem no_point_y4 (x : ℤ) (h : 16 = x ^ 3 - x ^ 2 - 12) : False := by
  have : x ^ 3 - x ^ 2 = 28 := by linarith
  have : x ≥ -4 ∧ x ≤ 5 := by nlinarith
  omega

theorem no_point_y8 (x : ℤ) (h : 64 = x ^ 3 - x ^ 2 - 12) : False := by
  have : x ^ 3 - x ^ 2 = 76 := by linarith
  have : x ≥ -4 ∧ x ≤ 6 := by nlinarith
  omega

theorem no_point_y16 (x : ℤ) (h : 256 = x ^ 3 - x ^ 2 - 12) : False := by
  have : x ^ 3 - x ^ 2 = 268 := by linarith
  have : x ≥ -5 ∧ x ≤ 8 := by nlinarith
  omega

end RCW.EllipticTorsion
