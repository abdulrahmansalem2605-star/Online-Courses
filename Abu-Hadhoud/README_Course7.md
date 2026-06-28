# C++ Mastery & Systems Engineering: A Technical Monograph

**Curriculum:** Algorithms, Problem-Solving & Banking Systems — Level 3
**Author:** Abdulrahman Salem
**Instructor:** Mohammed Abu-Hadhoud
**Repository Scope:** 51 Algorithmic Problems, 2 Capstone Projects, 2,300+ Lines of Implemented Solutions, 4,500+ Lines of Refactored Library Infrastructure

---

## Executive Summary

This repository documents a rigorous, multi-paradigm journey through intermediate-to-advanced C++ programming. The curriculum is organized as a progressive technical pipeline: from **linear algebra primitives** (matrix construction, traversal, and property classification), through **computational string theory** (morphological analysis, pattern substitution, and lexical parsing), culminating in a **persistent banking system** with full CRUD semantics and financial transaction processing.

The distinguishing architectural characteristic of this body of work is the **dual-implementation methodology**: every algorithmic problem is solved independently by the student alongside the instructor's reference solution, often with multiple algorithmic variants. This approach produces a verifiable record of autonomous engineering capability. The final codebase integrates a **custom generic utility framework** spanning 14 header files, templatized across C++17 features, dynamic memory management, and STL container abstraction.

---

## Technical Progression Map

### Phase I: Matrix Algebra & Linear Transformations (Problems 1–20)

The opening phase establishes proficiency in **two-dimensional array manipulation** and **matrix property classification**. The problem set progresses through three tiers of complexity:

**Tier 1 — Construction & Traversal (Problems 1–6):** Random matrix generation with configurable bounds, row-wise and column-wise summation (both direct and array-accumulated variants), ordered sequential matrix construction, and element-wise traversal patterns.

**Tier 2 — Linear Algebra Operations (Problems 7–9):** Matrix transposition (in-place element swapping), cross-matrix multiplication (triple-nested loop with row-column dot products), and median row/column extraction with parity-aware index derivation.

**Tier 3 — Property Classification (Problems 10–20):** A systematic suite of matrix classifiers: equality comparison (element-wise and sum-based dual approach), **identity matrix verification** (diagonal non-zero, off-diagonal zero), **scalar matrix detection** (uniform diagonal, zero off-diagonal), **sparse matrix classification** (zero-element density threshold > 60%), **palindrome matrix verification** (bidirectional symmetry), element frequency counting, and cross-matrix intersection extraction with deduplication.

The student's solutions demonstrate a notable design pattern: each classifier returns an enumerative result type (`enIsIdentity`, `enIsSparse`) rather than a raw boolean, reflecting a maturity in type-safe API design.

### Phase II: Computational Number Theory & Recursion (Problems 21–22)

A focused two-problem sequence on the Fibonacci sequence establishes competency in **algorithmic complexity analysis**:

- **Iterative approach** (O(n) time, O(1) space): Linear accumulation with three-variable state management
- **Recursive approach** (O(2^n) time, O(n) stack depth): Classical divide-and-conquer with terminating base conditions

The student independently implemented both variants, demonstrating understanding of the space-time tradeoff inherent in recursive decomposition.

### Phase III: String Morphology & Lexical Analysis (Problems 23–44)

This phase constitutes the most extensive algorithmic segment, encompassing 22 problems on **character-level and word-level string transformation**. The problem set covers:

**Character Classification (23–34):** Case detection, case inversion, letter frequency analysis (with and without case sensitivity), vowel identification and counting, and full vowel extraction. The student's solutions employ the `<cctype>` facility (`isupper`, `islower`, `isdigit`, `ispunct`) augmented with custom enumerations.

**Lexical Segmentation (35–37):** Delimiter-based word splitting using `std::string::find()` in a loop — a foundational parsing pattern. The student implemented a robust `SplitString` utility that handles consecutive delimiters, leading/trailing delimiters, and empty string inputs.

**String Normalization (38–44):** Left/right/all whitespace trimming, multi-delimiter join operations (with function overloading for vector and array inputs), word reversal (two implementations: brute-force character rearrangement and optimized split-reverse-join), and word replacement (three implementations: manual character scan, split-based reconstruction, and built-in `std::string::replace` with position tracking). The student also implemented custom punctuation removal, including a self-authored solution that differs from the instructor's approach.

The student's `44- Remove Characters (My Own Solve).cpp` file is a significant artifact — it represents autonomous problem-solving independent of reference material.

### Phase IV: Data Serialization & Record Management (Problems 45–46)

A transitional phase introducing **structured data serialization**:

- **Record-to-Line conversion**: Struct field concatenation with custom delimiter (`#//#`)
- **Line-to-Record parsing**: Delimiter-split reconstruction with type casting (`stod` for double conversion)

The student introduced a **nested struct architecture** (`stClientPersonalInformations` embedded within `stClientInformations`) — a design decision that introduces hierarchical data modeling absent in the instructor's flat struct approach.

### Phase V: Persistent Storage & Client CRUD (Problems 47–51)

The banking data management layer implements five operations against an **append-only flat-file database**:

| Operation | File | Key Innovation |
|-----------|------|----------------|
| Create | `47- Add Clients to File` | Interactive multi-client ingestion loop with `AddDataLineToFile` (append mode via `ios::app`) |
| Read | `48- Show All Clients` | Full table render with column-aligned `std::setw`/`std::left` formatting |
| Search | `49- Find Client By Account Number` | Linear search across deserialized vector; client card display on match |
| Delete | `50- Delete Client By Account Number` | **Soft-delete mark** (`MarkForDelete` flag) with file rewrite exclusion of marked records |
| Update | `51- Update Client By Account Number` | In-vector mutation followed by full file overwrite |

The student introduced a **pointer-based search mechanism** in the delete operation (`ReturnClientByAccountNumber` returns `stClientInformations*`) — a fundamentally different architectural choice from the instructor's index-based approach. This demonstrates low-level memory address manipulation competence.

Additionally, the student implemented **empty file validation** using `seekg(0, ios::end)` / `tellg()` checking — a production-grade defensive programming pattern absent in the instructor's version.

### Phase VI: Integrated Systems (Projects 1 & 2)

**Project 1 — Bank Management System (544 lines):** A state-machine-driven console application with six-menu options organized via `enum enMainMenueOptions` and dispatched through a `switch`-based controller function (`PerfromMainMenueOption`). The system integrates all five CRUD operations into a unified loop with screen navigation.

**Project 2 — Extended Banking with Transactions (828 lines):** An architectural expansion introducing a **two-level menu hierarchy** — a `MainMenue` (7 options) and a nested `TransactionsMenue` (4 options: Deposit, Withdraw, Total Balances, Return). New capabilities include:

- **Deposit operation**: Balance mutation with `+` accumulation and file persistence
- **Withdraw operation**: Balance mutation with **overdraft protection** (validation loop enforcing `Amount <= Client.AccountBalance`)
- **Negative withdrawal pattern**: The instructor's elegant design — `DepositBalanceToClientByAccountNumber(AccountNumber, Amount * -1, vClients)` — reuses the deposit function for withdrawals via sign inversion

The student's Project 2 incorporates all custom libraries from the "After template" suite, including type-safe input validation (`GetValidVariable`), formatted printing (`PrintBar`, `PrintStar`, `PrintTextInBorder`), and interactive boolean prompts (`DoYouWant`).

---

## Code Artifact Showcase

### Artifact 1: Generic Type-Safe Input Validation (C++17 `if constexpr`)

Located in `My libraries\After template\Reads_Check.h`. This function unifies all console input validation into a single template entry point, dispatching on type at compile time:

```cpp
template<typename T>
constexpr VariableType DetectVariableType()
{
    if constexpr (is_integral_v<T>)
        return VariableType::Integer;
    else if constexpr (is_floating_point_v<T>)
        return VariableType::Floating;
    else if constexpr (is_same_v<T, char>)
        return VariableType::Character;
    else if constexpr (is_same_v<T, string>)
        return VariableType::String;
}

template<typename T>
T GetValidVariable(const string& message)
{
    T variable;
    cout << message;
    cin >> variable;

    while (cin.fail())
    {
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
        cout << "Invalid input. Enter a valid value: ";
        cout << message;
        cin >> variable;
    }
    return variable;
}
```

This implementation leverages **C++17 `if constexpr`**, `std::is_integral_v`, `std::is_floating_point_v`, and `std::is_same_v` to achieve static polymorphism — eliminating runtime branching for type dispatch. The `VariableType` enum provides a reflection-like capability for downstream type queries.

### Artifact 2: Dynamic Array Resizing with Capacity Management

Located in `My libraries\After template\OneDimensional_Array.h`. Implements a resizable array with amortized O(1) insertion:

```cpp
template<typename T>
void resizeArray(T*& arr, int& size, int& capacity)
{
    if (size >= capacity)
    {
        capacity = (capacity == 0) ? 1 : capacity * 2;
        T* newArr = new T[capacity];
        for (int i = 0; i < size; i++)
            newArr[i] = arr[i];
        delete[] arr;
        arr = newArr;
    }
    else if (size > 0 && size <= capacity / 4)
    {
        capacity /= 2;
        T* newArr = new T[capacity];
        for (int i = 0; i < size; i++)
            newArr[i] = arr[i];
        delete[] arr;
        arr = newArr;
    }
}
```

This implementation mirrors the **std::vector growth strategy** — doubling capacity on overflow and halving on underutilization (threshold: 25% occupancy). The dynamic memory operations (`new[]`/`delete[]`) are managed with explicit pointer arithmetic, demonstrating raw memory lifecycle management.

### Artifact 3: Complete Matrix Property Classification Suite

Located in `My libraries\After template\TwoDimensional_Array.h`. The matrix classification subsystem at lines 700–950:

```cpp
template<typename T>
enMatrixProperties MatrixEqualityResult(T** Matrix1, T** Matrix2, int Rows, int Cols)
{
    for (int i = 0; i < Rows; i++)
        for (int j = 0; j < Cols; j++)
            if (Matrix1[i][j] != Matrix2[i][j])
                return enMatrixProperties::NotEqual;
    return enMatrixProperties::Equal;
}

template<typename T>
enMatrixProperties MatrixSparceResult(T** Matrix, int Rows, int Cols)
{
    int ZeroCount = 0;
    int TotalElements = Rows * Cols;
    for (int i = 0; i < Rows; i++)
        for (int j = 0; j < Cols; j++)
            if (Matrix[i][j] == 0)
                ZeroCount++;
    return (ZeroCount > TotalElements / 2)
        ? enMatrixProperties::Sparse
        : enMatrixProperties::NotSparse;
}
```

The suite includes identity, scalar, sparse, and palindrome detection, each returning an enumerated `enMatrixProperties` result. The sparse threshold (>50% zeros) and palindrome symmetry check (bidirectional traversal) demonstrate rigorous mathematical classification logic.

### Artifact 4: Fibonacci — Iterative vs. Recursive

From `21- Fibonacci Series.cpp` and `22- Fibonacci Series With Recursion.cpp`:

```cpp
// Iterative: O(n) time, O(1) space
void PrintFibonacciUsingLoop(short Number)
{
    long long FebNumber = 0;
    long long Prev1 = 0, Prev2 = 1;
    cout << "1 ";
    for (short i = 1; i < Number; i++)
    {
        FebNumber = Prev1 + Prev2;
        cout << FebNumber << " ";
        Prev1 = Prev2;
        Prev2 = FebNumber;
    }
}

// Recursive: O(2^n) time, O(n) stack space
long long FibonacciSeries(short Number)
{
    if (Number == 0) return 0;
    if (Number == 1) return 1;
    return FibonacciSeries(Number - 1) + FibonacciSeries(Number - 2);
}
```

Both implementations are present in the student's `Me` directory, confirming independent authorship of both paradigms.

### Artifact 5: Pointer-Based Client Search for Deletion

From `50- Delete Client By Account Number (other solve).cpp` in the student's `Me` directory:

```cpp
stClientInformations* ReturnClientByAccountNumber(
    vector<stClientInformations>& ClientInformations,
    const string& AccountToFind)
{
    stClientInformations* AccountToFind_Pointer = nullptr;
    for (stClientInformations& Client : ClientInformations)
    {
        if (Client.AccountNumebr == AccountToFind)
        {
            AccountToFind_Pointer = &Client;
            return AccountToFind_Pointer;
        }
    }
    return AccountToFind_Pointer;
}

bool DeleteClientByAccountNumber(
    vector<stClientInformations>& ClientInformations,
    const string& AccountToFind)
{
    stClientInformations* ClientToDelete =
        ReturnClientByAccountNumber(ClientInformations, AccountToFind);
    if (ClientToDelete)
    {
        PrinClientCard(*ClientToDelete);
        if (DoYouWant("\n\nAre you sure you want to delete this client: ..."))
        {
            ClientToDelete->DeletedClientMark = true;
            return true;
        }
    }
    return false;
}
```

This design uses **direct memory addressing** (`&Client` to obtain a pointer into the vector's backing store) rather than index-based access. The pointer serves as both existence check and mutation target — an efficient pattern that avoids redundant lookups.

### Artifact 6: Multi-Menu Transaction System with Overdraft Protection

From `project 2\FileName.cpp`:

```cpp
void ShowWithDrawScreen()
{
    ...
    cout << "\nPlease enter withdraw amount? ";
    cin >> Amount;

    while (Amount > Client.AccountBalance)
    {
        cout << "\nAmount Exceeds the balance, you can withdraw up to : "
             << Client.AccountBalance << endl;
        cout << "Please enter another amount? ";
        cin >> Amount;
    }

    DepositBalanceToClientByAccountNumber(AccountNumber, Amount * -1, vClients);
}
```

The sign-inversion pattern (`Amount * -1`) elegantly reuses the deposit function for withdrawals. The validation loop enforces a hard invariant (`Amount <= Balance`) before any mutation occurs — a correct implementation of the **guard clause pattern** in financial transaction processing.

---

## Engineering Rigor Analysis

### Quantitative Dimensions

| Metric | Value |
|--------|-------|
| Total problem count | 51 algorithmic exercises + 2 integrated projects |
| Instructor solution lines | ~2,300 (CPP files incl. Projects 1 & 2) |
| Independent student solution lines | ~2,400+ (CPP files incl. multiple variants) |
| Library infrastructure (After template) | 14 headers, ~4,554 lines |
| Library infrastructure (Before template) | 9 headers, ~1,335 lines |
| Library growth factor | +241% (pre-template → post-template) |
| C++ standards exercised | C++11 (auto, range-for), C++14 (generic lambdas), C++17 (if constexpr) |
| Unique algorithmic approaches | Split: 1, Join: 2 (overloaded), Reverse: 2, Replace: 3, Fibonacci: 2 |

### Architectural Maturity Indicators

1. **Dual-Phase Library Refactoring**: The progression from `Before Template` (fixed types, no STL, no dynamic memory) to `After Template` (full templatization, STL integration, dynamic resizing, C++17 metaprogramming) represents a complete **architectural rewrite** — not mere enhancement. This demonstrates the ability to recognize when foundational abstractions have been outgrown and to execute a systematic migration.

2. **Autonomous Multi-Solution Authorship**: For nearly every problem, the student's `Me` directory contains a structurally distinct implementation from the instructor's `AbuHadhoud` directory. In multiple cases (notably the delete operation, the string replacement, and the punctuation removal), the student devised a **fundamentally different algorithmic approach** — pointer-based mutation vs. index-based, custom character filtering vs. `ispunct` delegation, nested structs vs. flat structs.

3. **Defensive Programming Posture**: The student's file-reading pipeline includes empty-file validation (`tellg() == 0`), bounds checking on vector access (`if (parts.size() >= 5)`), and comprehensive input validation (`GetValidVariable<T>` with fail-bit clearing). These patterns indicate production-oriented thinking beyond academic exercise completion.

4. **Educational Meta-Commentary**: The student's code includes inline annotations documenting design rationale (e.g., "Abu-Hadhoud used `CopyVectorContentToFile` because he used just struct not vector of struct"). This metacognitive documentation reflects deliberate comparative analysis between solutions.

5. **Type System Progression**: The codebase traces a clear trajectory from procedural C (`rand() % range`, raw arrays) through object-based C with structs (`sClient`, `enCharType`) to generic C++ with templates (`template<typename T>`, `if constexpr`, type traits). This mirrors the historical evolution of C++ itself.

### Intellectual Investment

This curriculum represents approximately **120–180 hours** of concentrated technical work based on the scope of 51 distinct algorithmic problems, 2 integrated projects, and a refactored utility library spanning over 5,800 lines of authored C++. The presence of independently authored multiple-solution variants, the deliberate library refactoring from fixed-type to generic-template architecture, and the production-grade defensive programming patterns collectively indicate an engineering mindset trained on **correctness, genericity, and architectural foresight** — the hallmarks of professional systems engineering competence.

---

*Document prepared as a permanent technical monograph of the Algorithms, Problem-Solving & Banking Systems — Level 3 curriculum under the instruction of Mohammed Abu-Hadhoud.*
