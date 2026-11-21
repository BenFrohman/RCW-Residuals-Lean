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

private lemma sq_ge_of_le_neg (x a : ℤ) (ha : 0 ≤ a) (h : x ≤ -a) : a * a ≤ x * x := by
  have h1 : a ≤ -x := by linarith
  have hnn : 0 ≤ -x := by linarith
  have := mul_le_mul h1 h1 ha hnn
  simpa [mul_neg, neg_mul, neg_neg] using this

private lemma sq_ge_of_ge (x a : ℤ) (ha : 0 ≤ a) (h : a ≤ x) : a * a ≤ x * x := by
  have hnn : 0 ≤ x := by linarith
  exact mul_le_mul h h ha hnn

private lemma cubic_eq_factor (x c : ℤ) (h : x ^ 3 - x ^ 2 = c) : x ^ 2 * (x - 1) = c := by
  have : x ^ 2 * (x - 1) = x ^ 3 - x ^ 2 := by ring
  linarith

private lemma cubic_too_small (x c : ℤ) (h : x ^ 3 - x ^ 2 = c) (hx : x ≤ -4) (hc : -80 < c) :
    False := by
  have hfac := cubic_eq_factor x c h
  have hx2 : (4 : ℤ) * 4 ≤ x * x := sq_ge_of_le_neg x 4 (by decide) hx
  have hx1 : x - 1 ≤ -5 := by linarith
  have hnn : 0 ≤ x * x := mul_self_nonneg x
  have hmul : x * x * (x - 1) ≤ x * x * (-5) := mul_le_mul_of_nonneg_left hx1 hnn
  have hmul2 : x * x * (-5) ≤ (4 * 4) * (-5) := mul_le_mul_of_nonpos_right hx2 (by decide)
  have : x ^ 2 * (x - 1) ≤ -80 := by simpa [sq, mul_assoc] using le_trans hmul hmul2
  linarith

private lemma cubic_too_big (x c a : ℤ) (h : x ^ 3 - x ^ 2 = c) (hx : a ≤ x) (ha : 2 ≤ a)
    (hbig : c < a * a * (a - 1)) : False := by
  have hfac := cubic_eq_factor x c h
  have hx2 : a * a ≤ x * x := sq_ge_of_ge x a (by linarith) hx
  have hx1 : a - 1 ≤ x - 1 := by linarith
  have hnn : 0 ≤ x * x := mul_self_nonneg x
  have ha1 : 0 ≤ a - 1 := by linarith
  have hmul : a * a * (a - 1) ≤ x * x * (a - 1) := mul_le_mul_of_nonneg_right hx2 ha1
  have hmul2 : x * x * (a - 1) ≤ x * x * (x - 1) := mul_le_mul_of_nonneg_left hx1 hnn
  have : a * a * (a - 1) ≤ x ^ 2 * (x - 1) := by simpa [sq, mul_assoc] using le_trans hmul hmul2
  linarith

private lemma no_cubic_small (x c : ℤ) (h : x ^ 3 - x ^ 2 = c) (hc : -80 < c)
    (hbig : c < 5 * 5 * 4) : False := by
  have hsplit :
      x ≤ -4 ∨ x = -3 ∨ x = -2 ∨ x = -1 ∨ x = 0 ∨ x = 1 ∨ x = 2 ∨ x = 3 ∨ x = 4 ∨ 5 ≤ x := by
    omega
  rcases hsplit with hx | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | hx
  · exact cubic_too_small x c h hx hc
  · exact absurd h (by decide : (-3 : ℤ) ^ 3 - (-3) ^ 2 ≠ c)
  · exact absurd h (by decide : (-2 : ℤ) ^ 3 - (-2) ^ 2 ≠ c)
  · exact absurd h (by decide : (-1 : ℤ) ^ 3 - (-1) ^ 2 ≠ c)
  · exact absurd h (by decide : (0 : ℤ) ^ 3 - (0 : ℤ) ^ 2 ≠ c)
  · exact absurd h (by decide : (1 : ℤ) ^ 3 - (1 : ℤ) ^ 2 ≠ c)
  · exact absurd h (by decide : (2 : ℤ) ^ 3 - (2 : ℤ) ^ 2 ≠ c)
  · exact absurd h (by decide : (3 : ℤ) ^ 3 - (3 : ℤ) ^ 2 ≠ c)
  · exact absurd h (by decide : (4 : ℤ) ^ 3 - (4 : ℤ) ^ 2 ≠ c)
  · exact cubic_too_big x c 5 h hx (by decide) hbig

private lemma no_cubic_wide (x c : ℤ) (h : x ^ 3 - x ^ 2 = c) (hc : -80 < c)
    (hbig : c < 7 * 7 * 6) : False := by
  have hsplit :
      x ≤ -4 ∨ x = -3 ∨ x = -2 ∨ x = -1 ∨ x = 0 ∨ x = 1 ∨ x = 2 ∨ x = 3 ∨ x = 4 ∨ x = 5 ∨
        x = 6 ∨ 7 ≤ x := by
    omega
  rcases hsplit with hx | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | hx
  · exact cubic_too_small x c h hx hc
  · exact absurd h (by decide : (-3 : ℤ) ^ 3 - (-3) ^ 2 ≠ c)
  · exact absurd h (by decide : (-2 : ℤ) ^ 3 - (-2) ^ 2 ≠ c)
  · exact absurd h (by decide : (-1 : ℤ) ^ 3 - (-1) ^ 2 ≠ c)
  · exact absurd h (by decide : (0 : ℤ) ^ 3 - (0 : ℤ) ^ 2 ≠ c)
  · exact absurd h (by decide : (1 : ℤ) ^ 3 - (1 : ℤ) ^ 2 ≠ c)
  · exact absurd h (by decide : (2 : ℤ) ^ 3 - (2 : ℤ) ^ 2 ≠ c)
  · exact absurd h (by decide : (3 : ℤ) ^ 3 - (3 : ℤ) ^ 2 ≠ c)
  · exact absurd h (by decide : (4 : ℤ) ^ 3 - (4 : ℤ) ^ 2 ≠ c)
  · exact absurd h (by decide : (5 : ℤ) ^ 3 - (5 : ℤ) ^ 2 ≠ c)
  · exact absurd h (by decide : (6 : ℤ) ^ 3 - (6 : ℤ) ^ 2 ≠ c)
  · exact cubic_too_big x c 7 h hx (by decide) hbig

theorem no_point_y0 (x : ℤ) (h : 0 = x ^ 3 - x ^ 2 - 12) : False := by
  have : x ^ 3 - x ^ 2 = 12 := by linarith
  exact no_cubic_small x 12 this (by decide) (by decide)

theorem no_point_y1 (x : ℤ) (h : 1 = x ^ 3 - x ^ 2 - 12) : False := by
  have : x ^ 3 - x ^ 2 = 13 := by linarith
  exact no_cubic_small x 13 this (by decide) (by decide)

theorem no_point_y2 (x : ℤ) (h : 4 = x ^ 3 - x ^ 2 - 12) : False := by
  have : x ^ 3 - x ^ 2 = 16 := by linarith
  exact no_cubic_small x 16 this (by decide) (by decide)

theorem no_point_y4 (x : ℤ) (h : 16 = x ^ 3 - x ^ 2 - 12) : False := by
  have : x ^ 3 - x ^ 2 = 28 := by linarith
  exact no_cubic_small x 28 this (by decide) (by decide)

theorem no_point_y8 (x : ℤ) (h : 64 = x ^ 3 - x ^ 2 - 12) : False := by
  have : x ^ 3 - x ^ 2 = 76 := by linarith
  exact no_cubic_small x 76 this (by decide) (by decide)

theorem no_point_y16 (x : ℤ) (h : 256 = x ^ 3 - x ^ 2 - 12) : False := by
  have : x ^ 3 - x ^ 2 = 268 := by linarith
  exact no_cubic_wide x 268 this (by decide) (by decide)

end RCW.EllipticTorsion
