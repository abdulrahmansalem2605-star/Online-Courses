# Algorithms & Problem Solving — Level 1

## A Technical Monograph on Foundational Algorithmic Mastery

---

## Executive Summary

This repository constitutes the complete artifacts of **Algorithms & Problem Solving Level 1**, a rigorous 51-module curriculum spanning the full spectrum of foundational algorithmic design. The course progresses from absolute computational primitives — variable I/O, conditional branching, arithmetic expressions — through iterative control structures, combinatorial logic, geometric computation, modular arithmetic, and terminating I/O validation loops, culminating in a holistic multi-domain problem-solving capstone. The curriculum demonstrates an architecturally deliberate scaffolding: each module builds upon previously established patterns while introducing novel algorithmic dimensions, ensuring that the practitioner achieves not merely syntactic fluency but genuine **computational maturity**.

---

## Technical Progression Map

### Phase I — Algorithmic Foundations (Modules 001–006)

The opening sequence establishes the **fundamental paradigm** of algorithmic expression. Module 001–003 introduces the ontological definition of algorithms — a formal sequence of finite, unambiguous instructions for computation. Modules 004–005 instantiate this theory through the canonical **Hire a Driver** problem, presented in two cases that explore conditional reasoning: the evaluation of Boolean eligibility criteria (age, license status, experience thresholds). This dual-case treatment demonstrates an understanding that real-world decision logic often requires multiple branching topologies. Module 006 (FullName) introduces **string concatenation and I/O formatting**, establishing the operator chains that will underpin all subsequent textual output.

### Phase II — Arithmetic & Conditional Evaluation (Modules 007–017)

Modules 007–011 form a cohesive sub-tapestry exploring **threshold-based classification**. Beginning with *Half Number* (a pure arithmetic transform) and *Mark Pass Fail* (a binary conditional on a numerical threshold), the sequence escalates through *Sum of 3 Numbers*, *Average of 3 Marks*, and *Average Pass Fail*. The latter is a **composite decision criterion**: computing a derived metric (average) and then evaluating it against a passing threshold — a pattern endemic to real-world data processing pipelines.

Modules 012–013 (*Max of 2*, *Max of 3*) introduce **relational chaining** and the combinatorial explosion of comparison operators. The transition from binary to ternary maximum demonstrates the **scaling of conditional logic**: 2^1 comparisons become 3!/(2!1!) pairwise evaluations, requiring either nested selection or compound Boolean expressions.

Modules 014–017 (*Swap Numbers*, *Rectangle Area*, *Rectangle Area via Diagonal*, *Triangle Area*) pivot to **geometric computation** and **in-place state transformation**. The swap algorithm introduces the **temporary variable pattern** — a low-level memory management abstraction that surfaces in all subsequent sorting and rearrangement algorithms. The geometric sequence advances from trivial (Rectangle Area = a × b) to derived (Diagonal-and-Side rectangle area via Pythagorean decomposition), demonstrating **formulaic extrapolation**.

### Phase III — Geometric & Trigonometric Computation (Modules 018–023)

This block represents the curriculum's first encounter with **transcendental mathematical functions** and **formula derivation from geometric invariants**. The six-module sequence on circle area computation is architecturally significant:

| Module | Problem | Mathematical Pattern |
|--------|---------|---------------------|
| 018 | Circle Area from Radius | Direct: A = πr² |
| 019 | Circle Area from Diameter | Substitution: r = d/2 |
| 020 | Circle Area Inscribed in Square | Composite: A = π(a/2)² |
| 021 | Circle Area from Circumference | Inverse: A = C²/(4π) |
| 022 | Circle Area in Isosceles Triangle | Indirect: r from triangle geometry |
| 023 | Circle Area around Arbitrary Triangle | Circumradius: R = abc/(4Δ) |

The progression from direct substitution (module 019) to circumradius computation (module 023) spans multiple levels of algebraic indirection, culminating in a formula that requires the triangle's semi-perimeter and Heron's formula as prerequisites — a genuinely **sophisticated multi-step derivation**.

### Phase IV — Input Validation & Sentinel Loops (Modules 024–025)

Modules 024–025 introduce **bounded input validation** and **sentinel-controlled iteration**. *Validate Age Between 18 and 45* enforces a range constraint via compound Boolean (age >= 18 AND age <= 45). *Read Until Age Between* extends this into a **read-validate-retry loop** — an indefinite iteration pattern bounded by a logical condition rather than a counter. This is the curriculum's first exposure to the **defensive programming paradigm**, where input integrity is verified algorithmically rather than assumed.

### Phase V — Iteration & Accumulation Patterns (Modules 026–032)

This seven-module sequence forms the curriculum's **iterative computation core**:

- **026–027**: Counter-controlled loops with ascending/descending output (*Print 1 to N*, *Print N to 1*). These establish the **loop variable range** concept — the critical distinction between `for i = 1 to N` and `for i = N down to 1`.
- **028–029**: **Conditional accumulation** — summing only odd or even numbers within a range. This introduces the **modular filter** pattern (`i % 2 != 0`), a fundamental operation for data subsetting.
- **030**: *Factorial of N* — the classic **recursive product** pattern. The iterative implementation requires understanding of both **accumulator initialization** (`fact = 1`) and **multiplicative accumulation** across a bounded range.
- **031–032**: *Power of 2,3,4* and *Power of M* — the first is a multi-case exponential computation (fixed exponents); the second is a **generalized exponentiation** algorithm requiring a loop-based repeated multiplication. The generalization from fixed-base to variable-base exponentiation represents a significant **parametric abstraction**.

### Phase VI — Multi-Branch Classification & Calculation (Modules 033–036)

- **033**: *Grade Classification* — a **multi-way decision tree** mapping numerical scores to letter grades (A–F). This requires a cascading conditional structure (if-else if) and careful boundary analysis.
- **034**: *Commission Percentage* — **piecewise function evaluation** based on sales thresholds.
- **035**: *Piggy Bank Calculator* — a **currency denomination algorithm** that decomposes a total value into its constituent coin/bill components, demonstrating the **greedy decomposition** pattern.
- **036**: *Simple Calculator* — a **four-function arithmetic dispatcher** driven by operator selection, introducing the **command dispatch** architectural pattern.

### Phase VII — Sentinel Termination & Primality (Modules 037–038)

- **037**: *Sum Until -99* — a **sentinel-terminated accumulation** loop where a special value (not part of the data domain) signals termination. This is the first exposure to the **run-time indeterminate loop** pattern.
- **038**: *Is Prime Number* — **primality testing** via trial division up to √N. This module introduces the **early-exit conditional** (`break` or `return false` within the loop body) and the **divisibility predicate** (N % i == 0).

### Phase VIII — Financial & Temporal Computation (Modules 039–043)

- **039**: *Pay Remainder* — **modular arithmetic** for financial computation, calculating remaining balance after a payment.
- **040**: *Service Fee and Sales Tax* — **composite tax calculation** with additive fee structures, requiring chained arithmetic operations.
- **041**: *Weeks and Days* — **unit conversion via integer division and modulo**: `weeks = totalDays / 7; days = totalDays % 7`.
- **042**: *Task Duration in Seconds* — **aggregate-to-discrete decomposition**: hours×3600 + minutes×60 + seconds.
- **043**: *Seconds to Days/Hours/Minutes/Seconds* — the **inverse decomposition**: iterative extraction of the largest unit via division and remainder. This is the computational dual of module 042, requiring the engineer to understand the **base-60/24 hierarchical number system**.

### Phase IX — Calendar Logic & Enumeration (Modules 044–046)

- **044**: *Day of Week* — **temporal indexing** mapping a day number (1–7) to a day name. This requires a **multi-branch mapping** or lookup table.
- **045**: *Month of Year* — analogous mapping for months (1–12), reinforcing the **enumeration-to-label** pattern.
- **046**: *Print Letters A to Z* — **character iteration** using ASCII/Unicode ordinal sequences, demonstrating that the loop construct generalizes beyond numeric domains to include **character progression**.

### Phase X — Financial Planning & Security (Modules 047–050)

- **047**: *Loan Installment Months* — **fixed-payment amortization**, dividing total loan by monthly payment to compute duration.
- **048**: *Monthly Loan Installment* — the **inverse computation**: dividing loan by months to determine payment amount.
- **049**: *ATM PIN* — **single-attempt authentication**: comparing a user-entered PIN against a stored secret, with an equality predicate.
- **050**: *ATM PIN 3 Times* — **multi-attempt authentication** with a bounded retry counter and lockout upon exhaustion. This is a **security-critical algorithmic pattern** (rate-limiting, credential validation, state tracking across attempts).

### Capstone — Module 051: *What's Next*

The concluding module serves as a **curriculum meta-narrative**, mapping the completed journey and previewing the conceptual territory of subsequent levels — likely encompassing arrays, sorting, searching, recursion, and data structure construction.

---

## Engineering Rigor Analysis

### Taxonomic Completeness

The curriculum achieves coverage across all fundamental algorithmic categories:

| Category | Module Count | Representative Modules |
|----------|-------------|----------------------|
| Arithmetic & I/O | 9 | 001–011 |
| Conditional Logic | 7 | 004–005, 012–013, 024–025, 033 |
| Geometric Computation | 9 | 014–023 |
| Iterative Accumulation | 7 | 026–032 |
| Multi-Branch Decision | 4 | 033–036 |
| Financial Algorithms | 4 | 039, 040, 047, 048 |
| Temporal Conversion | 3 | 041–043 |
| Enumeration Mapping | 3 | 044–046 |
| Security Validation | 2 | 049–050 |
| Number Theory | 1 | 038 |

### Intellectual Investment Profile

The progression from module 001 to 051 represents a **monotonic increase in cognitive load** across multiple dimensions:

1. **Control Flow Complexity**: Sequential → Branching → Simple Loop → Nested Conditional Loop → Sentinel Loop → Multi-condition Iteration
2. **Data Abstraction**: Single variables → Derived expressions → Stateful accumulators → Transformed state → Parametric generalization
3. **Algorithmic Depth**: Direct formula → Single-step conditional → Multi-step derivation → Composite multi-phase computation → Security-critical state machine

The completion of this curriculum demonstrates a sustained engagement with computational thinking at an intensity level that builds genuine **algorithmic intuition** — the ability to decompose arbitrary real-world problems into sequences of discrete, executable operations.

---

## Certificate

This body of work is formally recognized by a **Certificate of Completion for Algorithms & Problem Solving — Level 1**, validating the successful traversal of all 51 algorithmic milestones.
