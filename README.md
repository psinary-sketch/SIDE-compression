# SIDE-compression v0.1

SIDE-compression compiles a statement on finite catalogues and a statement on a record of flags. Statements at e9a5a36:

    theorem compression {α : Type} {N : Nat} (C : Catalogue α N) (violates : α → Prop) (hex : Exhaustive C violates) (hchecks : ∀ i, ClassClear C i) : ∀ x, ¬ violates x (SIDECompression/ChainLength.lean :39)
    theorem silence_yields_compression (X : SIDEInstance) : allConditionsMet X.conditions = true → X.chainLength = X.formationTotal → compressionHolds X = true (SIDECompression/Basic.lean :245)

The first says that an exhaustive catalogue cleared class by class clears every object, with no interface hypothesis. The second takes X.chainLength = X.formationTotal as a hypothesis, chainLength being a hand-set field, so no statement concludes that chain length equals N from the conditions. No statement names ξ(s), a zero or the Silence Principle.

## Status

| | |
|---|---|
| Toolchain | `leanprover/lean4:v4.29.0-rc8` |
| Mathlib | not required |
| sorry | 0 |
| axioms | 0 |
| Author | J. York Seale (NaturalScience) |
| Programme | A PLACE TO STAND, Phase 2, May 2026 |

Companion paper: `COMPRESSION_THEOREM_DRAFT.md`.

## What's verified

### §1–§2 — Conditions and object counts
- `CompressionConditions` structure (exhaustive, darkInterfaces, finiteCheck)
- `ObjectCount` with finite and infinite cases
- `allConditionsMet`, `isInfinite`, `isFinite` predicates

### §3 — SIDE instances
- `xi_zeta`: N = 7, |objects| = ∞, chainLength = 7
- `platonic_solids`: N = 3, |objects| = 5, chainLength = 3
- `regular_tilings`: N = 3, |objects| = 3, chainLength = 3
- `hurwitz_surfaces`: N = 2, |objects| = 4, chainLength = 2
- `frobenius`: N = 3, |objects| = 3, chainLength = 3

### §4 — Compression Theorem at the instance level
- `xi_compression`, `platonic_compression`, `tilings_compression`, `hurwitz_compression`, `frobenius_compression` — each verifies `compressionHolds`

### §6 — The two regimes
- `Regime.protection` (finite objects) vs `Regime.compression` (infinite objects)

### §7 — Saturation
- `saturated`: |objects| = N (Tilings 3/3, Frobenius 3/3)
- `residual_entropy`: |objects| > N (Platonic 5/3, Hurwitz 4/2)

### §9 — Difficulty bound
- `maxChainLength`: formation total when conditions met, 0 otherwise
- Every instance's chain length within bound

### §10 — Panel-level theorems
- `panel_compression`: every panel instance satisfies Compression
- `panel_conditions_met`: every panel instance meets all three conditions
- `panel_chain_eq_formation`: every panel instance has chainLength = formationTotal

## What's NOT verified

- The general Compression Theorem proof — requires model-theoretic content (every "off-target behavior" traces to some mechanism class given exhaustive catalogue + dark interfaces) that lives in `COMPRESSION_THEOREM_DRAFT.md` §2.
- The historical claim about classical RH chains (infinite chain length via bright interfaces) — this is meta-historical commentary, not kernelizable mathematics.

## Build

```bash
lake build
```

Self-contained — no Mathlib.

## Federation context

| Kernel | Role |
|---|---|
| SIDE-silence-principle | Provides κ = 0 (condition b of Compression) |
| SIDE-structural-error-correction | d_eff = 2S − 1 for the protection regime |
| SIDE-kernel | ξ(s) seven mechanism classes proved exhaustive (condition a for ξ) |

## License

CC-BY 4.0.

> Seale, J. Y. (2026). *SIDE-compression v0.1: The Compression Theorem.* A PLACE TO STAND Research Programme.

---

`:: → · ← ::`

