# C++ Level 2 — Advanced Procedural Engineering: A Technical Monograph

**Program:** Introduction to Programming Using C++ (Level 2)
**Instructor:** Abu-Hadhoud
**Repository Domain:** Systems Programming, Memory Architecture, File I/O & Generic Library Design
**Total Source Units:** ~90 implementation files across 37 directories

---

## Executive Summary

This repository constitutes a comprehensive **second-level C++ curriculum** that bridges the chasm between introductory programming and systems-level engineering. The work spans **60 lessons** and **6 major homework assignments**, systematically progressing from debugging fundamentals through pointer arithmetic, dynamic memory management, generic (template-based) library construction, persistent file I/O with record mutation, date-time systems programming, and STL container orchestration.

The defining architectural achievement is the **template-based refactoring** of an entire utility library — transitioning from type-rigid, `long double`-centric functions to fully generic, type-safe templates. This transformation, preserved as both _Before Template_ and _After Template_ snapshots, demonstrates a mature understanding of C++'s compile-time polymorphism and represents the intellectual centerpiece of the curriculum.

---

## Technical Progression Map

### Phase I — Debugging Infrastructure & Execution Analysis
**Lessons #1–#7**

The curriculum opens not with syntax instruction but with **metacognitive tooling**: breakpoints, memory value inspection, autos/watch windows, and step-into/over/out navigation. This inversion — teaching the debugger before advanced language features — establishes a professional-grade development mindset. The student learns to _observe_ program state at the assembly/memory level before learning to _construct_ complex state.

Key artifact: `#2 Breakpoint & Memory Values.cpp` demonstrates live variable mutation during debug sessions, establishing a mental model of stack frames and memory addresses well before pointers are formally introduced.

### Phase II — Bitwise Computation & Branch Architecture
**Lessons #9–#13**

Ternary operator shorthand, bitwise AND/OR operators, and ranged-for loops mark the transition from naive conditional logic to **bit-level computation**. The student's work includes both standard and "readable" solutions for bitwise operations, evidencing a dual concern for correctness and maintainability. The `Ranged Loop.cpp` lesson introduces iterator abstraction, presaging the STL container work in later phases.

Skill Map:

| Operator | Application | Engineering Context |
|---|---|---|
| `?:` (Ternary) | Positive/Negative/Zero classification | Expression-level branching |
| `&` (Bitwise AND) | Masking and bit testing | Low-level flag manipulation |
| `\|` (Bitwise OR) | Bit-set construction | Permission/state bitfields |

### Phase III — Function Theory & Call Semantics
**Lessons #14–#22**

A rigorous treatment of **declaration versus definition**, default parameters, function overloading, call stack hierarchy, recursion, and storage class specifiers (static, automatic, register). The recursion homework (`Power N^M` and `Print Numbers from M down to N`) demonstrates comprehension of stack unwinding and base-case termination. The static/automatic variable lessons reveal understanding of **lifetime versus scope** — a concept that distinguishes novice from intermediate engineers.

### Phase IV — Formatted I/O & Output Engineering
**Lessons #23–#26**

`printf` format specifiers for integer, float, string, and char types, alongside the `setw` manipulator, equip the student with **domain-specific I/O formatting**. This is not merely cosmetic; the student constructs bordered tables, aligned columns, and visually structured console output — a hallmark of professional utility programming where output readability is a functional requirement.

### Phase V — Aggregate Data Structures
**Lessons #27–#32, Homeworks #27, #29, #30**

Two-dimensional arrays culminate in a **multiplication table generator** (`Homework #27`) — a 100-cell matrix with row/column headers, equation-sign borders, and hyphen separators. The progression then moves to **`std::vector`**, covering declaration, initialization, element addition, removal, vector-of-structures, and all major vector functions. The `Vector of Structure` homework (`#30`) introduces heterogeneous data aggregation via `struct stEmployee`, combining string and numeric fields into a single dynamic container.

### Phase VI — Indirection Architecture: References & Pointers
**Lessons #33–#44**

This is the curriculum's **critical depth charge**. The student progresses through:

1. **Call-by-value vs. call-by-reference** — demonstrable mutation semantics
2. **Reference variables** — alias-based indirection
3. **Pointer fundamentals** — address-of, dereference, common pitfalls
4. **Pointer-vs-reference comparison** — semantic differentiation
5. **Call-by-reference using pointers** — explicit address passing
6. **Pointers and arrays** — pointer arithmetic (`*(ptrArray + i)` ≡ `ptrArray[i]`)
7. **Pointers and structures** — member access via arrow operator
8. **Pointer to void** — type-erased generic pointers (full project, ~275 lines)
9. **Dynamic memory management** — `new`/`delete` for scalar and array allocation

The _Pointer to Void_ project (`#42`) is an architectural highlight: a single `void* GenericPtr` is reused across six distinct data types (int, short, float, long double, char, string), with a companion `stVariableInfo` structure logging name, value, reference, pointer value, and pointer-stored value. A custom `to_adaptive_string<T>()` template handles type-variant stringification with trailing-zero stripping — a production-quality utility function.

The _Memory Management_ project (`#43`) extends this with **dynamic allocation** — each type gets its own `new`/`delete` lifecycle, and a formatted table displays the complete memory topology. The embedded commentary on `char*` printing behavior (string literal vs. address) demonstrates deep understanding of C++'s type-system special cases.

### Phase VII — STL Container Mastery: Vector Iteration & Mutability
**Lessons #46–#48**

Vector element access (`at()` vs. `operator[]`), element mutation, and **iterator-based traversal** form a focused sub-unit. The `Vectors.h` library contains a comparative documentation block on range-checking semantics — evidence of API-level design reasoning. The `PrintVectorUsingIterator` function explicitly addresses the `typename` disambiguator requirement for dependent types in templates, showing compiler-architecture awareness.

### Phase VIII — Error Handling & String Processing
**Lessons #49–#51**

`try`/`catch` exception handling is introduced alongside the `std::string` object API (`find`, `substr`, `insert`) and CCTYPE functions (`toupper`, `islower`, `ispunct`, etc.). The `Strings.h` library wraps these into a cohesive namespace with null-safety checks using `string::npos`.

### Phase IX — Persistent Storage: File I/O & Record Management
**Lessons #52–#58**

A complete **file I/O subsystem** is constructed across seven lessons:

| Lesson | Mode | Operation |
|---|---|---|
| #52 | `ios::out` | Write (create/overwrite) |
| #53 | `ios::app` | Append |
| #54 | `ios::in` | Read & print |
| #55 | — | Load file to vector |
| #56 | — | Save vector to file |
| #57 | — | Delete record via vector |
| #58 | — | Update/replace record via vector |

The `Files.h` library (213 lines, post-template) implements the complete vector-mediated file manipulation pattern: load → mutate in memory → overwrite file. Both `DeleteRecord_From_FileContent_Using_Vector` and `ReplaceRecord_From_FileContent_Using_Vector` support interactive multi-record operations with empty-state guards and user confirmation loops — a **full CRUD implementation on flat-file storage**.

### Phase X — Temporal Systems Programming
**Lessons #59–#60, `Times.h`**

The final lessons address **date-time programming** using `ctime`, `gmtime`, `localtime`, and the `tm` struct. The `Times.h` library (167 lines) includes local-time display, UTC/GMT conversion, and full struct-field decomposition. A comprehensive historical commentary on C's naming conventions (e.g., `tm_isdst`, `tm_yday`) evidences scholarly engagement with language legacy. The `#pragma warning(disable : 4996)` with documented rationale for `_s` function alternatives shows awareness of thread safety and deprecation standards.

---

## Code Artifact Showcase

### Artifact 1: Compile-Time Type Dispatch Engine (`Reads_Check.h`)

```cpp
enum VariableType { Integer, Floating, Character, String };

template<typename T>
constexpr VariableType DetectVariableType()
{
    if constexpr (std::is_integral_v<T> && !std::is_same_v<T, char> && !std::is_same_v<T, bool>)
        return VariableType::Integer;
    else if constexpr (std::is_floating_point_v<T>)
        return VariableType::Floating;
    else if constexpr (std::is_same_v<T, char>)
        return VariableType::Character;
    else if constexpr (std::is_same_v<T, std::string>)
        return VariableType::String;
    else
        static_assert(!sizeof(T), "Unsupported data type, try again please.");
}

template<typename T>
T GetValidVariable(const string& message)
{
    if constexpr (DetectVariableType<T>() == VariableType::Integer)
        return static_cast<T>(GetValidNumber(
            static_cast<long double>(numeric_limits<T>::min()),
            static_cast<long double>(numeric_limits<T>::max()), message));
    else if constexpr (DetectVariableType<T>() == VariableType::Floating)
        return static_cast<T>(GetValidNumber(
            -numeric_limits<long double>::max(),
            numeric_limits<long double>::max(), message));
    else if constexpr (DetectVariableType<T>() == VariableType::Character)
        return GetValidChar(CHAR_MIN, CHAR_MAX, message);
    else if constexpr (DetectVariableType<T>() == VariableType::String)
        return ReadString(message);
    else
        return GetValidVariable<T>(message);
}
```

This is the **type-dispatch backbone** of the entire library. `if constexpr` with `<type_traits>` predicates routes any C++ type to its appropriate validated input routine — integer range-checking, floating-point boundary validation, character range scanning, or string acquisition — all resolved at compile time.

### Artifact 2: Generic Pointer-to-Void Type Erasure (`#42 Pointer to Void (full project).cpp`)

```cpp
void* GenericPtr;

template <typename T>
string pointerToString(T* ptr)
{
    ostringstream oss;
    oss << static_cast<const void*>(ptr);
    return oss.str();
}

void PointerToInteger(stVariableInfo& VariableInfo, int IntegerValue)
{
    GenericPtr = &IntegerValue;
    VariableInfo.PtrValue = pointerToString(GenericPtr);
    int GenericPtr_SortedValue = IntegerValue;
    VariableInfo.PtrSortedVariableValue = to_string(GenericPtr_SortedValue);
}
```

A single `void*` handle is sequentially reassigned to variables of six distinct types. The `pointerToString` template performs the required `static_cast<const void*>` to bypass `char*`'s special string-printing semantics, ensuring uniform hexadecimal address output.

### Artifact 3: Template-Based Library Refactoring (Before/After Comparison)

**Before Template** — type-restricted, `long double` hardcoded:
```cpp
long double MaxNumberInArray(long double arr[], unsigned short arrLength)
{
    long double Max = arr[0];
    for (unsigned short i = 1; i < arrLength; i++)
        if (arr[i] > Max) Max = arr[i];
    return Max;
}
```

**After Template** — fully generic, any numeric type:
```cpp
template<typename T>
T MaxNumberInArray(const T arr[], unsigned short arrLength)
{
    T Max = arr[0];
    for (unsigned short i = 1; i < arrLength; i++)
        if (arr[i] > Max) Max = arr[i];
    return Max;
}
```

The transformation spans all 15 library headers, converting every array algorithm, digit processor, key generator, and randomizer from `long double`-specific implementations into **compile-time polymorphic utilities**. The `ArrayAverage` function further demonstrates dual-type-parameter templates (`T1` input type, `T2` return type) for precision control.

### Artifact 4: Dynamic Array with Pointer Arithmetic (`#44`)

```cpp
float* ptrArray;
ptrArray = new float[NumberOfStudents];

void ReadGradesOfStudents(float* ptrArray, unsigned short NumberOfStudents)
{
    for (unsigned short i = 0; i < NumberOfStudents; i++)
        *(ptrArray + i) = GetValidNumber(0, 100, message);
}
```

The `delete[]` lifecycle is paired with `new[]`; pointer arithmetic (`*(ptrArray + i)`) is explicitly noted as equivalent to subscript notation — a demonstration of array-pointer duality understanding.

### Artifact 5: Full CRUD on Flat File (`Files.h`)

```cpp
void ReplaceRecord_From_FileContent_Using_Vector(string FileName)
{
    vector<string> vFileContent;
    LoadDataFileToVector(FileName, vFileContent);
    do {
        string OldRecord = ReadString("\nEnter the record you want to replace please: ");
        string NewRecord = ReadString("\nEnter the new record...: ");
        for (string& Line : vFileContent)
            if (Line == OldRecord) Line = NewRecord;
    } while (DoYouWantToReplaceMoreRecords());
    ReplaceFileContentWithVectorData(FileName, vFileContent);
}
```

The **load-mutate-persist** pattern is applied for both deletion and replacement, with `ios::out` (truncate) mode ensuring the file reflects only the final vector state after all mutations.

---

## Engineering Rigor Analysis

### Intellectual Investment

The repository documents a **deliberate, non-linear learning trajectory**. The presence of both instructor and student solution directories across every lesson and homework — preserved with complete diff-ability — indicates a methodology of _comparative mastery_: the student implements independently, then contrasts with the reference solution. Commented-out instructor code is retained as annotations, forming an inline dialogue between teacher and learner.

### Architectural Maturity Indicators

1. **Namespace isolation** — Every library resides in its own `namespace My*`, preventing symbol collision across a 90+ file ecosystem.
2. **Template progression** — The _Before Template_ → _After Template_ directory pair documents a deliberate refactoring phase, not incremental accretion.
3. **Self-documenting code** — Inline ASCII-art tables, bordered output, and formatted console displays demonstrate concern for UX even in educational tooling.
4. **Edge-case hardening** — Input validation functions (`GetValidNumber`, `GetValidLongLong`, `GetValidChar`) wrap every user interaction with `cin.fail()` recovery, range clamping, and type checking.
5. **Security-conscious file I/O** — `fstream::is_open()` checks, `close()` calls after every operation, and empty-file detection via `seekg(0, ios::end)` / `tellg()`.
6. **Thread-safety awareness** — The `Times.h` library includes explicit commentary on `gmtime` vs. `gmtime_s` and the rationale for `_CRT_SECURE_NO_WARNINGS`.

### Scale Metrics

| Dimension | Count |
|---|---|
| Library headers (post-template) | 15 |
| Total source files | ~90 |
| Lessons implemented | 60 |
| Homework projects | 6 |
| Namespace-separated modules | 12 distinct |
| Distinct data types handled in generic code | 5+ (int, short, float, double, char, string) |

### Conclusion

This repository is not a collection of exercises — it is a **systems-programming apprenticeship rendered in C++**. The arc from breakpoint debugging through `void*` type erasure, template metaprogramming, dynamic memory management, and flat-file CRUD operations represents a complete foundational curriculum in procedural and generic programming. The template library refactoring, preserved as a before/after architectural artifact, evidences a developer who not only writes code but **designs APIs** — a distinction that marks the transition from programmer to software engineer.
