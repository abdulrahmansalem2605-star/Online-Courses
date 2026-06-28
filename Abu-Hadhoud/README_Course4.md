# Algorithms & Problem-Solving Level 1: A Technical Monograph on Foundational Software Engineering Mastery

## Executive Summary

This repository constitutes a complete archival record of the **Algorithms & Problem-Solving Level 1** curriculum under the instruction of **Abu Hadhoud**, comprising **50 problem milestones** executed across **114 implementation files** (64 student-authored, 50 instructor reference). The work demonstrates a methodical traversal from trivial I/O operations to compound algorithmic systems involving state machines, modular arithmetic pipelines, type-safe enumeration hierarchies, and binary-search-based numerical methods. The student's output is distinguished by **multi-variant exploration**—producing alternative solves, cleaner refactors, enum-parameterized generalizations, and experimental edge-case harnesses—signaling an engineering maturity that transcends rote comprehension and enters the territory of **deliberate practice and systematic optimization**.

---

## Technical Progression Map

### Phase 1: Foundational I/O and Procedural Abstraction (Problems #1–#7)

The opening sequence establishes the bedrock of procedural decomposition. The learner progresses from a literal `PrintName` invocation (Problem #1) through console input acquisition (`ReadName`, #2) and parity checking (`Even/Odd`, #3) to the first multi-criteria decision system—the **Hire-a-Driver** predicate chain (#4–#5). Critically, the student produces **two architectural variants** of the driver-hire problem:

- **Case 1** (#4): Uses loose boolean functions and manual recursion on invalid input, demonstrating early understanding of validation loops.
- **Case 2** (#5): Introduces `struct StInfo` to aggregate age, license status, and recommendation into a single cohesive data type, plus **early-exit optimization** via recommendation shortcut—a design decision typically encountered in production authorization systems.

The **FullName** problem (#6) reveals the first use of `enum class NameOrder { Normal, Reversed }`, applying type-safe enumeration to control presentation logic, an architectural pattern that recurs throughout the corpus.

### Phase 2: Arithmetic Computation and Geometric Domain Modeling (#8–#23)

This phase represents a sustained engagement with **computational geometry** and **floating-point mathematics**. The curriculum introduces:

- **Aggregate statistics**: Summation, averaging, pass/fail thresholds (#8–#11)
- **Comparative logic**: Bounded maximum determination with binary comparisons (#12–#13)
- **Memory operations**: In-place value swapping via temporary variables (#14), with a second cleaner variant employing tuple-like reassignment

The geometric sequence (#15–#23) is particularly rigorous: the student implements area calculations for rectangles (standard, diagonal-side), triangles (base-height, circumscribed circle), and circles (radius, diameter, inscribed in square, along circumference, inscribed in isosceles triangle, circumscribed around arbitrary triangle). Problem #23—**Circle Area Described Around an Arbitrary Triangle**—demands Heron's formula composition: computing a triangle's area from three sides, then deriving the circumradius via `R = (a * b * c) / (4 * sqrt(p * (p - a) * (p - b) * (p - c)))`, and finally computing circle area. This is a **three-stage mathematical pipeline** expressed through cleanly separated functions.

### Phase 3: Loop Paradigms and Series Accumulation (#24–#32)

The learner systematically explores all three C++ loop constructs—`for`, `while`, `do-while`—across problems involving:

- **Bounded input validation**: Age range enforcement (#24–#25), factorial computation (#30)
- **Numeric series**: Forward/backward counting (#26–#27), odd/even summation (#28–#29)
- **Exponentiation engines**: Power of M (#32) with manual iterative multiplication

A standout artifact is the **bonus file** `#NULL sum odd or even or all using enum.cpp`, which implements a **triple-loop-pattern demonstration**: each of the three loop constructs is used to solve the identical summation problem, parameterized by an `enOddOrEvenOrAll` enum. This is a deliberate exercise in **loop construct comparison** and **behavioral parameterization**—a software engineering concern, not merely a programming exercise.

### Phase 4: Financial Systems and State-Machine Design (#33–#40)

This phase marks the transition from pure computation to **stateful system simulation**:

- **Tiered commission calculator** (#34): A cascade of five threshold brackets (`>=1M -> 1%`, `>=500K -> 2%`, etc.), demonstrating **interval partitioning**
- **Piggy Bank Calculator** (#35): A **full coin-inventory system** employing an array of `struct Coin { enCoinsType type; enCoinsValue value; int count; }`, initialized via type-to-value mapping functions, and iterated for total aggregation. This is a **miniature accounting engine**.
- **Simple Calculator -- Part Two** (#36, 317 lines): The **most architecturally sophisticated file in the corpus**. It implements a two-mode calculator (unary vs. binary operations) with:
  - A **binary-search square root algorithm** employing `low`/`high`/`mid` pointers
  - Factorial with integer-domain enforcement (`floor(number) != number` guard)
  - Trigonometric functions with degree-to-radian conversion and **domain checking** (tan undefined at 90 deg)
  - Division-by-zero protection, modulus with integer truncation semantics
  - Operator validation via enum comparison against raw character input
- **ATM PIN systems** (#49-#50): A **multi-try state machine** with digit-level validation, retry counters, visual feedback (`system("color")`), and early termination on success. The student produced **three variants**—basic, infinite-loop experimental, and the canonical 3-try version.

### Phase 5: Temporal Decomposition and Unit Conversion (#41-#48)

The terminal phase introduces **modular arithmetic for time dissection**:

- **Task Duration in Seconds** (#42): Converts days/hours/minutes/seconds to total seconds via `pow(60, 2)` scaling
- **Seconds to Days/Hours/Minutes/Seconds** (#43): The **inverse operation**, using successive `fmod` decomposition—an essential pattern in real-time systems programming
- **The student produces cleaner solves** for both #42 and #43, demonstrating **iterative refactoring competence**: in the cleaner version of #43, the conversion chain is expressed as a single expression pipeline within `SecondsToTaskDuration()`

---

## Code Artifact Showcase

### Artifact 1: Compound Geometric Computation — Circumscribed Circle Area

```cpp
float CalculateNumerator(float a, float b, float c) {
    return a * b * c;
}

float CalculateDenominator(float a, float b, float c) {
    float p = CalculateArbitraryTriangleSemiPerimeter(a, b, c);
    return 4 * sqrt(p * (p - a) * (p - b) * (p - c));
}

float CalculateCircleAreaByArbitraryTriangle(float a, float b, float c) {
    float Numerator = CalculateNumerator(a, b, c);
    float Denominator = CalculateDenominator(a, b, c);
    float fraction = Numerator / Denominator;
    float area = PI() * pow(fraction, 2);
    return area;
}
```

**Architecture**: Three-layer function composition separating **numerator** (product of sides), **denominator** (Heron's-formula-based circumdiameter scaling), and **final area** (pi*R^2). Each function is independently testable and semantically named.

### Artifact 2: Binary-Search Square Root Engine

```cpp
long double calculateRoot(long double number) {
    if (number < 0) { /* validation */ }
    if (number == 0 || number == 1) return number;

    long double low = 2;
    long double high = number;
    long double result = 0;
    while (low <= high) {
        long double mid = low + (high - low) / 2;
        long double square = mid * mid;
        if (square == number)      return mid;
        else if (square < number) { low = mid + 1; result = mid; }
        else                       { high = mid - 1; result = mid; }
    }
    return result;
}
```

**Significance**: Implements the **Babylonian-inspired binary search root finder**, a non-trivial numerical algorithm that avoids floating-point library dependencies. The `low + (high - low) / 2` formulation prevents overflow—a production-grade precaution.

### Artifact 3: Multi-Calculator Dispatch System with Operator Validation

```cpp
long double ClaculateMultiOperations(long double numbers[2], int Length, enMultiOperations Operators) {
    switch (Operators) {
    case Addition:       return getAddition(numbers, Length);
    case Subtraction:    return getSubtraction(numbers, Length);
    case Multiplication: return getMultiplication(numbers, Length);
    case Division:       return getDivision(numbers, Length);
    case Power:          return getPower(numbers, Length);
    case Modulus:        return getModulus(numbers, Length);
    default:             return -999.999;
    }
}
```

**Architecture**: A **dispatch table** pattern mapping `enMultiOperations` enum values to dedicated handler functions. The validation layer ensures only the six symbolic operators (`+`, `-`, `*`, `/`, `^`, `%`) pass through, with a `while` loop rejecting invalid characters. The division handler includes a **zero-denominator guard** that re-prompts the user.

### Artifact 4: Multi-Loop Pattern Demonstration with Type-Safe Enum Parameterization

```cpp
long long SumNumbersFromNTo1_UsingForLoop(long long N, enOddOrEvenOrAll SumType) {
    long long sum = 0;
    for (long long i = 1; i <= N; i++) {
        switch (SumType) {
        case Odd:  if (CheckOddOrEven(i) == Odd)  sum += i; break;
        case Even: if (CheckOddOrEven(i) == Even) sum += i; break;
        case All:  sum += i; break;
        }
    }
    return sum;
}
```

**Significance**: Demonstrates **behavioral polymorphism via enum parameterization**—the same function body adapts to three summation strategies, controlled entirely by the caller. This pattern recurs in modern C++ as `std::variant` dispatch.

### Artifact 5: ATM PIN Finite State Machine

```cpp
bool CheckPINCodeThreeTimes() {
    unsigned short Tries = 3;
    while (Tries--) {
        bool CheckOnce = CheckPINCodeOnce();
        if (!CheckOnce) {
            system("color CF");
            cout << '\a';
            continue;
        } else {
            return true;
        }
    }
    return false;
}
```

**Architecture**: A **3-try finite state machine** with the following states: (1) digit-by-digit PIN entry with per-character validation, (2) mismatch detection triggering visual/auditory feedback (`color CF` + bell), (3) retry countdown, (4) final lockout with `"Card is blocked"` state. The digit-level entry (`GetValid_PINCode_Digits`) constrains input to `'0'`-`'9'` before comparison, eliminating injection risk.

---

## Engineering Rigor Analysis

### Multi-Variant Exploration

The student's directory contains **14 additional files** beyond the instructor's 50-problem set, comprising:

| Variant Type | Examples |
|---|---|
| Cleaner refactors | `#26 cleaner way`, `#27 cleaner way`, `#42 cleaner solve`, `#43 cleaner solve` |
| Enum-based alternatives | `#38 using enum`, `#6 FullName with enum`, `#NULL sum using enum` |
| Experimental approaches | `#14 cleaner way`, `#31 other solve`, `#36 part two` |
| Edge-case exploration | `#49 ATM PIN (inf loop)` |

This is the hallmark of an engineer who **does not stop at correctness** but pursues **optimal expression**, **type safety**, and **algorithmic diversity**.

### Architectural Patterns Consistently Applied

1. **Welcome/Read/Validate/Process/Print** — Every program follows this architectural invariant, producing a predictable and navigable control flow.
2. **Input validation as a universal concern** — Every numeric input is bounded, sanitized, and re-prompted on failure, often through dedicated functions like `GetPositiveInput`, `GetValidUnaryOperation`, and `ValidateNumberInRange`.
3. **Type-safe enumeration** — The student adopted `enum class` and conventional `enum` for operation selection, coin types, summation modes, and primality states, eschewing magic numbers throughout.
4. **Structural data aggregation** — `struct` usage appears from Problem #5 onward for grouping related parameters (user info, task duration, coin inventory), indicating an early grasp of data cohesion.

### Intellectual Investment

The complete corpus spans **114 source files**, each manually authored, tested, and refined. The presence of cleaner solves, experimental variants, and expanded feature sets (e.g., the calculator Part Two with 317 lines versus the instructor's 80-line baseline) demonstrates **voluntary over-delivery** well beyond assignment requirements. The work embodies a **deliberate practice regimen** under the Abu Hadhoud pedagogical framework, with the student independently extending each problem's scope into adjacent engineering concerns—error handling, type safety, algorithmic choice, and system decomposition.

---

*This monograph captures a foundational software engineering journey executed with exceptional thoroughness, architectural awareness, and intellectual curiosity. The repository stands as a durable record of technical competence acquired through disciplined, methodical problem-solving.*
