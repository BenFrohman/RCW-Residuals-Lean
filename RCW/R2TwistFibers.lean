import Mathlib.Algebra.Order.Ring.Abs
import Mathlib.Data.Int.Order.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Positivity

/-!
Author: Benjamin Stanley Frohman
Date: 15 November 2026
License: Apache-2.0

Machine-checked certificate that residual R2 has no solutions
on any twist fiber with 1 ≤ |d| ≤ (r - 3)/2.
-/

namespace RCW_R2_TwistFibers

/-- No integer square lies strictly between `n²` and `(n+1)²`. -/
private theorem no_square_between (n Y : ℤ) (hn : 0 ≤ n)
    (h_low : n ^ 2 < Y ^ 2) (h_high : Y ^ 2 < (n + 1) ^ 2) : False := by
  have h_abs : |n| < |Y| := (sq_lt_sq).mp h_low
  have h1 : n < |Y| := by simpa [abs_of_nonneg hn] using h_abs
  have h2 : |Y| < n + 1 := abs_lt_of_sq_lt_sq h_high (by linarith)
  have hle : |Y| ≤ n := (Int.lt_add_one_iff).mp h2
  linarith

/-- Consecutive-square squeeze for positive twist fibers. -/
theorem R2_positive_fiber_no_square
    (r d Y : ℤ) (hr : 5 ≤ r) (hd_pos : 1 ≤ d) (hd_ub : 2 * d ≤ r - 3)
    (h_eq : Y ^ 2 = r ^ 6 + 2 * r ^ 5 + r ^ 4 + r ^ 3 + (2 * r ^ 2 + r + 1) * d) :
    False := by
  have hr_pos : 0 < r := by linarith
  have hQ : 0 < 2 * r ^ 2 + r + 1 := by nlinarith
  set A : ℤ := r ^ 3 + r ^ 2
  have hA : 0 ≤ A := by dsimp [A]; positivity
  have h_low : A ^ 2 < Y ^ 2 := by
    have h_diff : Y ^ 2 - A ^ 2 = r ^ 3 + (2 * r ^ 2 + r + 1) * d := by
      dsimp [A]; rw [h_eq]; ring
    have h_pos : 0 < r ^ 3 + (2 * r ^ 2 + r + 1) * d := by nlinarith
    linarith
  have h_high : Y ^ 2 < (A + 1) ^ 2 := by
    have h_gap : (A + 1) ^ 2 - Y ^ 2 =
        r ^ 3 + 2 * r ^ 2 + 1 - (2 * r ^ 2 + r + 1) * d := by
      dsimp [A]; rw [h_eq]; ring
    have h_twice : (2 * r ^ 2 + r + 1) * (2 * d) =
        2 * ((2 * r ^ 2 + r + 1) * d) := by ring
    have h_mul : (2 * r ^ 2 + r + 1) * (2 * d) ≤
        (2 * r ^ 2 + r + 1) * (r - 3) :=
      mul_le_mul_of_nonneg_left hd_ub hQ.le
    have h_poly : (2 * r ^ 2 + r + 1) * (r - 3) =
        2 * r ^ 3 - 5 * r ^ 2 - 2 * r - 3 := by ring
    have h_slack : (2 * r ^ 3 + 4 * r ^ 2 + 2) -
        (2 * r ^ 3 - 5 * r ^ 2 - 2 * r - 3) = 9 * r ^ 2 + 2 * r + 5 := by ring
    nlinarith
  exact no_square_between A Y hA h_low h_high

/-- Consecutive-square squeeze for negative twist fibers. -/
theorem R2_negative_fiber_no_square
    (r d Y : ℤ) (hr : 5 ≤ r) (hd_neg : d ≤ -1) (hd_lb : -(r - 3) ≤ 2 * d)
    (h_eq : Y ^ 2 = r ^ 6 + 2 * r ^ 5 + r ^ 4 + r ^ 3 + (2 * r ^ 2 + r + 1) * d) :
    False := by
  have hr_pos : 0 < r := by linarith
  have hQ : 0 < 2 * r ^ 2 + r + 1 := by nlinarith
  set A : ℤ := r ^ 3 + r ^ 2
  have hA : 0 ≤ A := by dsimp [A]; positivity
  have h_low : A ^ 2 < Y ^ 2 := by
    have h_diff : Y ^ 2 - A ^ 2 = r ^ 3 + (2 * r ^ 2 + r + 1) * d := by
      dsimp [A]; rw [h_eq]; ring
    have h_twice : (2 * r ^ 2 + r + 1) * (2 * d) =
        2 * ((2 * r ^ 2 + r + 1) * d) := by ring
    have h_mul : (2 * r ^ 2 + r + 1) * (-(r - 3)) ≤
        (2 * r ^ 2 + r + 1) * (2 * d) :=
      mul_le_mul_of_nonneg_left hd_lb hQ.le
    have h_poly : (2 * r ^ 2 + r + 1) * (r - 3) =
        2 * r ^ 3 - 5 * r ^ 2 - 2 * r - 3 := by ring
    nlinarith
  have h_high : Y ^ 2 < (A + 1) ^ 2 := by
    have h_gap : (A + 1) ^ 2 - Y ^ 2 =
        r ^ 3 + 2 * r ^ 2 + 1 - (2 * r ^ 2 + r + 1) * d := by
      dsimp [A]; rw [h_eq]; ring
    nlinarith
  exact no_square_between A Y hA h_low h_high

end RCW_R2_TwistFibers
