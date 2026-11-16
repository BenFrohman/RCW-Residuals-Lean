import Lake
open Lake DSL

package «RCW-Residuals-Lean» where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.14.0"

@[default_target]
lean_lib «RCW» where
  roots := #[`RCW]
