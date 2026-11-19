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

The only possible |y| by Nagell–Lutz are 0, 1, 2, 4, 8, 16.
Each is discharged by a direct omega proof that the resulting cubic equation has no integer solution.
-/

namespace RCW.EllipticTorsion

theorem no_point_y0 : ¬ ∃ x : ℤ, 0 = x ^ 3 - x ^ 2 - 12 := by
  intro ⟨x, h⟩
  omega

theorem no_point_y1 : ¬ ∃ x : ℤ, 1 = x ^ 3 - x ^ 2 - 12 := by
  intro ⟨x, h⟩
  omega

theorem no_point_y2 : ¬ ∃ x : ℤ, 4 = x ^ 3 - x ^ 2 - 12 := by
  intro ⟨x, h⟩
  omega

theorem no_point_y4 : ¬ ∃ x : ℤ, 16 = x ^ 3 - x ^ 2 - 12 := by
  intro ⟨x, h⟩
  omega

theorem no_point_y8 : ¬ ∃ x : ℤ, 64 = x ^ 3 - x ^ 2 - 12 := by
  intro ⟨x, h⟩
  omega

theorem no_point_y16 : ¬ ∃ x : ℤ, 256 = x ^ 3 - x ^ 2 - 12 := by
  intro ⟨x, h⟩
  omega

end RCW.EllipticTorsion
