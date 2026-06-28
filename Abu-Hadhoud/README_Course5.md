# Algorithms & Problem Solving — Level 2: A Technical Monograph on C++ Computational Mastery

## Executive Summary

This repository constitutes a rigorous, high-volume C++ curriculum encompassing **50 algorithmic problems** and **2 capstone projects**, solved across approximately **150 source files**. The work reflects a dual-track methodology: canonical solutions provided by instructor *AbuHadhoud* are systematically re-implemented, extended, and often surpassed by the student ("Me") through multiple independent solution strategies — including direct iteration, recursion, and advanced algorithmic refinements. Four dedicated utility libraries encapsulate cross-cutting concerns (digit manipulation, array operations, random generation, input validation), establishing a **production-adjacent code architecture** within an academic context.

---

## Technical Progression Map

### Phase 1: Foundational Control Flow & Arithmetic Logic

The opening problems establish core competencies in loop construction, conditional evaluation, and integer arithmetic. Problems **#1–#7** build from a simple multiplication table generator through prime number detection, perfect number verification, and digit-wise reversal/summation. Each problem is solved with explicit input validation loops (`do...while`) and early enum-based return types (`enPrimNotPrime`, `enIsPerfectNumber`, `enEvenOrOdd`), demonstrating an immediate commitment to **type-safe semantic encoding** rather than raw integer flags.

### Phase 2: Digit Decomposition & Frequency Analysis

Problems **#8–#11** introduce algorithmic digit analysis: frequency counting of individual digits within integers, all-digit frequency tables, ordered digit printing, and palindrome detection via full numeric reversal. The engineering maturity here is evident in the student's **dual-paradigm implementation** — each problem is solved both iteratively *and* recursively. The recursion variant of digit frequency counting (`#8 Digit Frequency (recursion solve).cpp:54`) elegantly separates the base case from the accumulation logic, using the call stack as an implicit accumulator.

### Phase 3: Pattern Generation & Combinatorial Exhaustion

Problems **#12–#16** escalate into nested-loop pattern generation — inverted number pyramids, sequential number patterns, and their letter-based ASCII analogues. Problem **#16** (AAA-to-ZZZ word generation) implements a **triply nested Cartesian product** over the 26-letter uppercase alphabet, producing all 17,576 possible 3-letter combinations. The student's "other solve 2" variant demonstrates awareness of algorithmic symmetry. The brute-force password guesser (**#17**) repurposes this same combinatorial engine as a **linear-search attack simulator**, counting trials until match.

### Phase 4: Cryptographic Primitives & Randomness Engineering

Problem **#18** introduces a **Caesar-style substitution cipher** — each character is shifted by a user-specified encryption level. The bi-directional encrypt/decrypt pair is a textbook symmetric-key scheme. Problems **#19–#21** then build a comprehensive random-generation subsystem: uniform integer distribution, typed character generation (lowercase, uppercase, special, digit — including multi-range special-character sampling across four ASCII bands), and compound key generation in `XXXX-XXXX-XXXX-XXXX` format. The student's "more advance solve" for random character generation (`#20`) implements **range-aware weighted selection** for special characters spanning ASCII 33–47, 58–64, 91–96, and 123–126.

### Phase 5: One-Dimensional Array Algorithms

Problems **#22–#35** form the curricular core, covering the complete array algorithm repertoire:
- Traversal & statistics (max, min, sum, average)
- Copy & transformation (direct copy, reverse-order copy, prime-only filtering)
- Search (linear search with index return, boolean membership test)
- Shuffling (Fisher–Yates–style random swap iteration)
- Key generation arrays

The library file `One Dimensional array.cpp` (531 lines) evolves into a **full-fledged reusable module**, accumulating 30+ functions with multiple overloads and variant implementations. Notably, the student annotates their own functions vs. the instructor's, preserving an "engineering changelog" within the code itself.

### Phase 6: Dynamic Array Semantics & Filter Pipelines

Problems **#36–#45** mark a transition from static arrays to **semi-dynamic array construction**. The `AddArrayElement` pattern (increment length, assign at new index) combined with `IsArray_Overflow` guarding enables safe incremental population. This pattern is then composed into **filter pipelines**:

```
Source Array → [IsPrime? / IsOdd? / IsDistinct?] → AddArrayElement → Destination Array
```

The distinct-element extraction algorithm (**#40**) uses a **membership-check pre-filter**: for each source element, it queries the destination array via `FindElementIndexInArray`, only appending if absent — an O(n²) algorithm suitable for the bounded problem size, demonstrating awareness of the time–space trade-off.

Array palindrome detection (**#41**) uses a symmetric two-pointer comparison (`arraySource[i] != arraySource[ArraySourceSize - 1 - i]`). The student provides three variants: a "weak solve" (intentionally suboptimal for contrast), a standard solve, and an "advance" solve with full manual input and overflow protection.

### Phase 7: Custom Numerical Library Implementation

Problems **#46–#50** constitute a **ground-up reimplementation of the C standard library's `<cmath>` math functions**:
- **MyABS**: Conditional negation for signed magnitude
- **MyRound**: Fractional-part thresholding with sign-aware boundary handling (`++number` for positive ≥0.5, `--number` for negative)
- **MyFloor**: Integer truncation for positive; subtract-one for negative fractional values
- **MyCeil**: Add-one for positive fractional; integer truncation for negative
- **MySqrt**: Delegation to `pow(number, 0.5)` — a pragmatic dependency-aware implementation

Each function is validated against its standard library counterpart, establishing a **test-harness pattern** within each `main()`.

### Phase 8: Capstone Systems Integration

**Project 1 — Rock-Paper-Scissors** (`Me/Projects/Project 1 (fixed all problems).cpp:356 lines`): A full state-machine implementation with:
- Enum-driven game logic (`enChoice`, `enResult`)
- Nested switch-based win resolution (3×3 decision matrix)
- Multi-round scoring with aggregate winner determination
- Console UI with colored screen feedback (green/red/yellow for win/loss/draw)
- Play-again loop with validated character input
- The "fixed all problems" variant adds: dynamic round count, `ResetGameResult` state reinitialization, and `PrintTabs` for formatted output alignment

**Project 2 — Math Quiz Game** (`Me/Projects/Project 2 (Math Game).cpp:495 lines`): A **parameterized quiz engine** supporting:
- 4 difficulty levels (Easy 1–10, Medium 10–50, Hard 50–100, Mix)
- 4 operation types (+, -, ×, ÷) plus random Mix
- Float-precision division with `roundf(result * 100) / 100` for 2-decimal accuracy
- Real-time screen color feedback per question
- Final results dashboard (question count, level, operation type, right/wrong tally)
- Pass/Fail threshold (≥50% correct)
- Input sanitization for both integer and float ranges
- `ResetQuiz` state reinitialization for replay

---

## Code Artifact Showcase

### Recursive Digit Frequency Counter (Me, #8)

```cpp
unsigned short CountDigitFrequency(unsigned long long Number, char digitToCheck)
{
    unsigned short Reminder;
    if (Number == 0)
        return 0;

    Reminder = Number % 10;
    unsigned short FrequencyCounter = CountDigitFrequency(Number / 10, digitToCheck);

    if (Reminder == digitToCheck - '0')
        return 1 + FrequencyCounter;
    return FrequencyCounter;
}
```

A textbook tail-recursive decomposition: reduce the problem by one digit, recurse, then conditionally accumulate on the return path. The base case `Number == 0` terminates recursion. The result is built bottom-up through the call stack.

### Multi-Range Special Character Generator (Me, #20, "more advance solve")

```cpp
char GetRandomChar(enRandom choice)
{
    switch (choice)
    {
    case enRandom::SpecialCharacter:
    {
        unsigned rangSelector = rand() % 4;
        if (rangSelector == 0)      return RandomNumbers(33, 47);
        else if (rangSelector == 1) return RandomNumbers(58, 64);
        else if (rangSelector == 2) return RandomNumbers(91, 96);
        else                        return RandomNumbers(123, 126);
    }
    // ...
    }
}
```

Uniform selection across four disjoint ASCII special-character ranges via a two-stage random process: first pick the band, then pick within the band. This demonstrates awareness that the ASCII special-character space is non-contiguous and requires stratified sampling.

### Dynamic Array Filter Pipeline (Me, #40, advance)

```cpp
void CopyDistinctNumbersToArray(long double arraySource[], unsigned short ArraySourceSize,
    long double DistinctArray[], unsigned short& DistinctArrayLength)
{
    for (size_t i = 0; i < ArraySourceSize; i++)
    {
        if (!Get_FindElementIndexInArray_Result(DistinctArray, DistinctArrayLength, arraySource[i]))
        {
            AddArrayElement(arraySource[i], DistinctArray, DistinctArrayLength);
        }
    }
}
```

A composable filter pipeline: `Get_FindElementIndexInArray_Result` acts as a predicate, `AddArrayElement` as the accumulation primitive. The pattern generalizes to any predicate (prime, odd, even, positive, negative) — evidenced by the homologous implementations for odd-only and prime-only copies.

### Math Quiz — Parameterized Question Engine (Me, Project 2)

```cpp
void AnswerQuestions(stQuiz& Quiz)
{
    for (short QuestionNumber = 0; QuestionNumber < Quiz.NumberOfQuestions; QuestionNumber++)
    {
        SetQuestionOperationType(Quiz, QuestionNumber);
        SetQuestionLevel(Quiz, QuestionNumber);
        GetOneQuestion(Quiz.QuestionList[QuestionNumber]);
        PrintOneQuestion(Quiz, QuestionNumber);
        AnswerOneQuestion(Quiz.QuestionList[QuestionNumber]);
        GetNumberOf_Wrong_Right_Answers(Quiz, QuestionNumber);
    }
}
```

A **six-stage question pipeline**: operation type resolution (mix→random selection), difficulty resolution (mix→random selection), operand generation, formatted display, answer capture & validation, and score tracking. The separation of `SetQuestionOperationType` from `SetQuestionLevel` allows independent mixing — a design that supports the full Cartesian product of difficulty × operation type.

---

## Engineering Rigor Analysis

The intellectual investment demonstrated in this repository is best measured not by the problem count but by the **multiplicity of approaches per problem**. The student systematically solves most problems in 2–5 variants (direct, recursion, advanced, alternate direct, alternate recursion), creating an implicit **comparative analysis framework**. Key indicators of engineering maturity include:

| Attribute | Evidence |
|---|---|
| **Type Safety** | 15+ `enum` types used in lieu of magic numbers or boolean flags |
| **Input Validation** | Centralized `ValidateNumberInRange` / `GetValidNumber` family with domain-specific overloads (short, long double, char, unsigned long long) |
| **Modularity** | 4 library files (totaling ~1,100 lines) with reusable, composable functions |
| **Defensive Programming** | `IsArray_Overflow` guards, division-by-zero protection, `ResetQuiz`/`ResetGameResult` state reinitialization |
| **Algorithmic Variety** | Iterative, recursive, and filter-pipeline patterns for identical problems |
| **Self-Documenting Code** | Descriptive function names, embedded comments documenting design rationale, instructor-vs-student function annotations |
| **UI/UX Engineering** | Colored console output (`system("color")`), alert sounds (`cout << '\a'`), formatted tab-aligned results, screen clearing |
| **Real-World Systems Thinking** | Replay loops, session state management, aggregate statistics dashboard |

The recursion suite alone — spanning digit printing, digit reversal, palindrome checking, digit frequency counting, and inverted pattern generation — represents a deliberate pedagogical investment in **declarative problem decomposition** beyond the imperative baseline.

This is not merely a set of solved problems. It is an **engineered knowledge graph** where each concept is visited multiple times through different lenses, with reusable infrastructure extracted along the way, and with two production-scale integrated projects serving as the final synthesis. The work constitutes a **rigorous, self-contained C++ algorithmic portfolio** that bridges foundational programming constructs with system-level architectural thinking.
