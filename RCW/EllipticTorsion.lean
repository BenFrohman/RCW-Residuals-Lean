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

def possibleAbsY : List ℕ := [0, 1, 2, 4, 8, 16]

theorem no_integral_torsion_point
    (y : ℤ) (hy : y.natAbs ∈ possibleAbsY) :
    ¬ ∃ x : ℤ, y ^ 2 = x ^ 3 - x ^ 2 - 12 := by
  intro ⟨x, h⟩
  fin_cases hy <;> 
    (try { interval_cases x <;> omega }) <;>
    omega

end RCW.EllipticTorsion
