/-
  SIDECompression/ChainLength.lean
  The Compression Theorem — general structural skeleton.

  The paper's claim (COMPRESSION_THEOREM_DRAFT; FOUNDATIONS §IV): under an
  exhaustive mechanism catalogue with per-class finite checks, the derivation
  of a universal conclusion over all objects — possibly infinitely many —
  consumes exactly the N per-class checks plus one exhaustiveness application.
  Chain length is the formation total N, not the object count.

  This module compiles that skeleton. Discharging `Exhaustive` and
  `ClassClear` for a concrete system is mathematical content proved in the
  manuscripts; the kernel verifies the architecture that makes N checks
  suffice. Vanilla Lean 4; no Mathlib; expected axiom-free.
-/

namespace Compression

/-- A mechanism catalogue over objects `α`: `N` classes, where
    `produces i x` reads "class `i` can produce the violation `x`". -/
structure Catalogue (α : Type) (N : Nat) where
  produces : Fin N → α → Prop

/-- Exhaustiveness (the domain-completeness condition): every violation
    traces to some class in the catalogue. -/
def Exhaustive {α : Type} {N : Nat} (C : Catalogue α N)
    (violates : α → Prop) : Prop :=
  ∀ x, violates x → ∃ i, C.produces i x

/-- Per-class check: class `i` produces no violation. There are exactly
    `N` of these — the finite verification obligations. -/
def ClassClear {α : Type} {N : Nat} (C : Catalogue α N) (i : Fin N) : Prop :=
  ∀ x, ¬ C.produces i x

/-- **The Compression Theorem (structural skeleton).** N per-class checks
    plus exhaustiveness yield the universal conclusion over all objects.
    The hypothesis set is indexed by `Fin N`: the derivation's obligations
    number `N`, independent of the cardinality of `α`. -/
theorem compression {α : Type} {N : Nat} (C : Catalogue α N)
    (violates : α → Prop)
    (hex : Exhaustive C violates)
    (hchecks : ∀ i, ClassClear C i) :
    ∀ x, ¬ violates x := by
  intro x hv
  obtain ⟨i, hp⟩ := hex x hv
  exact hchecks i x hp

/-- The infinitely-unsaturated regime made explicit: an infinite object
    type (`Nat`) compresses through a finite catalogue — the shape of the
    ξ instance (N = 7 certifying infinitely many zeros). -/
theorem compression_infinite_objects {N : Nat} (C : Catalogue Nat N)
    (violates : Nat → Prop)
    (hex : Exhaustive C violates)
    (hchecks : ∀ i, ClassClear C i) :
    ∀ n : Nat, ¬ violates n :=
  compression C violates hex hchecks

end Compression
