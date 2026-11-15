/-!
Author: Benjamin Stanley Frohman
Date: 15 November 2026
License: Apache-2.0

Machine-checked certificate that residual R2 has no solutions
on any twist fiber with 1 ≤ |d| ≤ (r - 3)/2.
-/

import Mathlib.Data.Int.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Nlinarith
import Mathlib.Tactic.Ring

namespace RCW_R2_TwistFibers

/-- Consecutive-square squeeze for positive twist fibers. -/
theorem R2_positive_fiber_no_square
    (r d Y : ℤ) (hr : 5 ≤ r) (hd_pos : 1 ≤ d) (hd_ub : 2 * d ≤ r - 3)
    (h_eq : Y ^ 2 = r ^ 6 + 2 * r ^ 5 + r ^ 4 + r ^ 3 + (2 * r ^ 2 + r + 1) * d) :
    False := by
  have hr_pos : 0 < r := by linarith
  have h_quad_pos : 0 < 2 * r ^ 2 + r + 1 := by nlinarith
  have h_low : (r ^ 3 + r ^ 2) ^ 2 < Y ^ 2 := by
    have h_diff : Y ^ 2 - (r ^ 3 + r ^ 2) ^ 2 = r ^ 3 + (2 * r ^ 2 + r + 1) * d := by
      rw [h_eq]; ring
    have h_pos1 : 0 < r ^ 3 := pow_pos hr_pos 3
    have h_pos2 : 0 < (2 * r ^ 2 + r + 1) * d := mul_pos h_quad_pos (by linarith)
    linarith
  have h_high : Y ^ 2 < (r ^ 3 + r ^ 2 + 1) ^ 2 := by
    have h_gap : (r ^ 3 + r ^ 2 + 1) ^ 2 - Y ^ 2 =
        r ^ 3 + 2 * r ^ 2 + 1 - (2 * r ^ 2 + r + 1) * d := by
      rw [h_eq]; ring
    have h_mul : (2 * r ^ 2 + r + 1) * (2 * d) ≤ (2 * r ^ 2 + r + 1) * (r - 3) :=
      mul_le_mul_of_nonneg_left hd_ub h_quad_pos.le
    have h_poly : (2 * r ^ 2 + r + 1) * (r - 3) = 2 * r ^ 3 - 5 * r ^ 2 - 2 * r - 3 := by ring
    have h_r2 : 0 < 5 * r ^ 2 + 2 * r + 5 := by nlinarith
    linarith
  set A : ℤ := r ^ 3 + r ^ 2
  have hA_nonneg : 0 ≤ A := by dsimp [A]; positivity
  rcases le_or_gt 0 Y with hY_nonneg | hY_neg
  · have h1 : A < Y := by nlinarith
    have h2 : Y < A + 1 := by nlinarith
    linarith
  · have h1 : A < -Y := by nlinarith
    have h2 : -Y < A + 1 := by nlinarith
    linarith

/-- Consecutive-square squeeze for negative twist fibers. -/
theorem R2_negative_fiber_no_square
    (r d Y : ℤ) (hr : 5 ≤ r) (hd_neg : d ≤ -1) (hd_lb : -(r - 3) ≤ 2 * d)
    (h_eq : Y ^ 2 = r ^ 6 + 2 * r ^ 5 + r ^ 4 + r ^ 3 + (2 * r ^ 2 + r + 1) * d) :
    False := by
  have hr_pos : 0 < r := by linarith
  have h_quad_pos : 0 < 2 * r ^ 2 + r + 1 := by nlinarith
  have h_high : Y ^ 2 < (r ^ 3 + r ^ 2) ^ 2 := by
    have h_gap : (r ^ 3 + r ^ 2) ^ 2 - Y ^ 2 = -r ^ 3 - (2 * r ^ 2 + r + 1) * d := by
      rw [h_eq]; ring
    have h_mul : (2 * r ^ 2 + r + 1) * (-2 * d) ≤ (2 * r ^ 2 + r + 1) * (r - 3) :=
      mul_le_mul_of_nonneg_left (by linarith) h_quad_pos.le
    have h_poly : (2 * r ^ 2 + r + 1) * (r - 3) = 2 * r ^ 3 - 5 * r ^ 2 - 2 * r - 3 := by ring
    have h_r2 : 0 < 5 * r ^ 2 + 2 * r + 3 := by nlinarith
    linarith
  have h_low : (r ^ 3 + r ^ 2 - 1) ^ 2 < Y ^ 2 := by
    have h_gap : Y ^ 2 - (r ^ 3 + r ^ 2 - 1) ^ 2 =
        3 * r ^ 3 + 2 * r ^ 2 - 1 + (2 * r ^ 2 + r + 1) * d := by
      rw [h_eq]; ring
    have h_mul : (2 * r ^ 2 + r + 1) * (-2 * d) ≤ (2 * r ^ 2 + r + 1) * (r - 3) :=
      mul_le_mul_of_nonneg_left (by linarith) h_quad_pos.le
    have h_poly : (2 * r ^ 2 + r + 1) * (r - 3) = 2 * r ^ 3 - 5 * r ^ 2 - 2 * r - 3 := by ring
    have h_r3 : 0 < 4 * r ^ 3 + 9 * r ^ 2 + 2 * r + 1 := by nlinarith
    linarith
  set A : ℤ := r ^ 3 + r ^ 2 - 1
  have hA_nonneg : 0 ≤ A := by dsimp [A]; nlinarith
  rcases le_or_gt 0 Y with hY_nonneg | hY_neg
  · have h1 : A < Y := by nlinarith
    have h2 : Y < A + 1 := by nlinarith
    linarith
  · have h1 : A < -Y := by nlinarith
    have h2 : -Y < A + 1 := by nlinarith
    linarith

end RCW_R2_TwistFibers
