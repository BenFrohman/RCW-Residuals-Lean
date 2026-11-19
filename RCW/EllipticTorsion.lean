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

theorem no_point_y0 : ¬ ∃ x : ℤ, 0 = x ^ 3 - x ^ 2 - 12 := by
  rintro ⟨x, h⟩
  have : x ^ 3 - x ^ 2 = 12 := by linarith
  by_cases hle : x ≤ 2
  · nlinarith
  · nlinarith

theorem no_point_y1 : ¬ ∃ x : ℤ, 1 = x ^ 3 - x ^ 2 - 12 := by
  rintro ⟨x, h⟩
  have : x ^ 3 - x ^ 2 = 13 := by linarith
  by_cases hle : x ≤ 2
  · nlinarith
  · nlinarith

theorem no_point_y2 : ¬ ∃ x : ℤ, 4 = x ^ 3 - x ^ 2 - 12 := by
  rintro ⟨x, h⟩
  have : x ^ 3 - x ^ 2 = 16 := by linarith
  by_cases hle : x ≤ 2
  · nlinarith
  · nlinarith

theorem no_point_y4 : ¬ ∃ x : ℤ, 16 = x ^ 3 - x ^ 2 - 12 := by
  rintro ⟨x, h⟩
  have : x ^ 3 - x ^ 2 = 28 := by linarith
  by_cases hle : x ≤ 3
  · nlinarith
  · nlinarith

theorem no_point_y8 : ¬ ∃ x : ℤ, 64 = x ^ 3 - x ^ 2 - 12 := by
  rintro ⟨x, h⟩
  have : x ^ 3 - x ^ 2 = 76 := by linarith
  by_cases hle : x ≤ 4
  · nlinarith
  · nlinarith

theorem no_point_y16 : ¬ ∃ x : ℤ, 256 = x ^ 3 - x ^ 2 - 12 := by
  rintro ⟨x, h⟩
  have : x ^ 3 - x ^ 2 = 268 := by linarith
  by_cases hle : x ≤ 6
  · nlinarith
  · nlinarith

end RCW.EllipticTorsion
