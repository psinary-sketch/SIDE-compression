# SIDE-compression v0.1

Kernel verification of the **Compression Theorem**: when a determined system satisfies (a) exhaustive mechanism catalogue, (b) dark interfaces (κ = 0, Silence Principle), and (c) finite check per class, the derivation chain length equals N, the formation total — regardless of how many objects (finite or infinite) are being certified.

For ξ(s): seven mechanism classes certify infinitely many zeros. Compression factor ∞/7.

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

## The headline

```
chain length = N   when (a) exhaustive ∧ (b) dark interfaces ∧ (c) finite check
```

Condition (b) is the Silence Principle's κ = 0. The Compression Theorem is Consequence A of Silence applied to information content: dark interfaces isolate behavioral perturbations, so one check per mechanism class certifies all objects simultaneously.

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

### §5 — Specific chain lengths and object counts
- ξ(s) chain length = 7, objects infinite
- Platonic chain length = 3, objects = 5
- Hurwitz chain length = 2, objects = 4

### §6 — The two regimes
- `Regime.protection` (finite objects) vs `Regime.compression` (infinite objects)
- ξ(s) in compression regime; finite SIDE instances in protection regime

### §7 — Saturation
- `saturated`: |objects| = N (Tilings 3/3, Frobenius 3/3)
- `residual_entropy`: |objects| > N (Platonic 5/3, Hurwitz 4/2)
- `infinitely_unsaturated`: |objects| = ∞ (ξ(s))

### §8 — Bridge to Silence Principle
- `silence_implies_compression_eligible`: condition (b) = κ = 0
- `silence_yields_compression`: structural implication theorem

### §9 — Difficulty bound
- `maxChainLength`: formation total when conditions met, 0 otherwise
- Every instance's chain length within bound

### §10 — Panel-level theorems
- `panel_compression`: every panel instance satisfies Compression
- `panel_conditions_met`: every panel instance meets all three conditions
- `panel_chain_eq_formation`: every panel instance has chainLength = formationTotal

## What's NOT verified

- The general Compression Theorem proof — requires model-theoretic content (every "off-target behavior" traces to some mechanism class given exhaustive catalogue + dark interfaces) that lives in `COMPRESSION_THEOREM_DRAFT.md` §2. The kernel verifies the **conclusion** at each instance.
- The Difficulty = chain_length × interface_brightness equation — kernelized only at the bound level (`maxChainLength`), not as a general continuous-κ formula.
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
| **SIDE-compression** | **Chain length = N when conditions hold** |
| SIDE-structural-error-correction | d_eff = 2S − 1 for the protection regime |
| SIDE-kernel | ξ(s) seven mechanism classes proved exhaustive (condition a for ξ) |

The Compression Theorem and the Formation Distance Theorem are complementary: Compression governs the chain length (information bandwidth) under dark interfaces; Formation Distance governs the d_eff (error-correction capacity) of those same dark compartments.

## License

CC-BY 4.0.

> Seale, J. Y. (2026). *SIDE-compression v0.1: The Compression Theorem.* A PLACE TO STAND Research Programme.

---

`:: → · ← ::`

*Seven checks for infinitely many zeros. Compression is what dark interfaces do.*
