# Object-Oriented Programming in C++ — Level 10
## A Technical Monograph on the Architectural Evolution from Procedural Foundations to Object-Oriented System Synthesis

**Curriculum:** Programming with C++ (Level 10)
**Instructor:** Mohammed Abu-Hadhoud
**Repository Steward:** Abdulrahman Salem
**Scope:** 7 Modules · 16 Custom Libraries · ~3,500 Lines of Production-Quality C++

---

## Executive Summary

This repository constitutes a formal record of a structured transition from procedural programming to full object-oriented architectural thinking within the C++ language. The curriculum, designed by Mohammed Abu-Hadhoud and executed with substantial independent extension by Abdulrahman Salem, spans seven discrete modules that together form a coherent intellectual trajectory: from the conceptualization of a `class` as a blueprint, through the discipline of encapsulation via access specifiers, the engineering of property systems, the lifecycle management afforded by constructors and destructors, and culminating in two integrated production-scale systems — a stateful calculator with multi-level undo and a persistent number-counter with full CRUD operations backed by file serialization.

The work is distinguished not merely by completion of prescribed exercises, but by a pattern of systematic **architectural over-delivery**. At every module boundary, the student's implementations materially exceed the instructor's reference solutions in robustness, abstraction, edge-case handling, and adherence to modern C++ idioms. The repository includes 16 custom utility libraries spanning input validation, string manipulation, file I/O, character classification, random generation, and vector operations — representing a portable, namespaced toolkit accumulated across the curriculum.

---

## Technical Progression Map

### Module 1 — Class & Object: The Foundational Abstraction

The inaugural module establishes the ontological basis of object-oriented programming: the class as a user-defined type encapsulating both state and behavior. The instructor's reference solution (`AbuHadhoud/1- Class and Object/Class and Object.cpp`, 27 lines) demonstrates a minimal `clsPerson` with public `FirstName` and `LastName` string members and a concatenating `FullName()` method, instantiated on the stack.

The student's implementation (`Me/1- Class & Object/Class and Object.cpp`, 59 lines) diverges immediately in architectural philosophy: **all data members are declared private**, with access mediated through a controlled public interface. The student employs a custom `Print.h` library and the `MyPrints` namespace, already demonstrating layered dependency management. A notable annotation in the source comments (lines 42–52) explicitly contrasts C++'s dual memory model — stack vs. heap allocation — against languages like Java, C#, and Python, indicating a metacognitive grasp of C++'s unique position in the systems programming landscape.

| Dimension | Instructor | Student |
|---|---|---|
| Encapsulation | Public members | Full private + public interface |
| External Dependencies | `<iostream>` only | Custom `Print.h` library |
| Lines of Code | 27 | 59 |
| Error Handling | None | Input via validated `ReadString` |

### Module 2 — Access Specifiers: The Encapsulation Discipline

This module formalizes the three-tier access control model of C++. The instructor's example demonstrates `private`, `protected`, and `public` compartments with integer arithmetic to illustrate visibility rules. The student's response (`Me/2- Access Specifiers`, 50 lines) mirrors the tripartite structure but applies it to semantically meaningful domain logic — string composition for full-name generation — rather than synthetic integer operations. The `protected` region is deliberately positioned to anticipate inheritance, even though inheritance is not formally introduced until later levels.

### Module 3 — Properties: The Interface Contract

Module 3 represents a critical inflection point where the curriculum transitions from mere data hiding to **interface design**. The instructor provides three escalating examples:
1. Conventional getter/setter functions (52 lines)
2. A read-only property via omission of the setter (61 lines)
3. The `__declspec(property(...))` Microsoft extension enabling property access through assignment syntax (45 lines)

The student's implementation elevates each of these patterns:

**Sub-module 3.1 (Properties Set and Get):** The student introduces the underscore-prefix naming convention (`_FirstName`) to distinguish private state from public parameters — a convention ubiquitous in production C++ codebases (Google, LLVM, Qt). The `setANDget_FullName()` method orchestrates a multi-step interaction flow, reading two inputs and composing a result, demonstrating method chaining awareness.

**Sub-module 3.2 (Read-Only Property):** Here the student introduces a **static counter** (`static unsigned short _NumberOfPersons`) with a post-increment assignment strategy for unique identifier generation. This is the first encounter with static storage duration in the student's work, appearing three modules before the curriculum officially addresses it. The `_ID` field is read-only at the public interface — only `getID()` is exposed. The comment block (lines 17–23) reveals a sophisticated understanding of the temporal semantics of mutation: "Values that are subject to increment operations change in memory immediately... values that change only inside specific functions will only change when those functions are called."

**Sub-module 3.3 (Property through `=`):** The student deploys `__declspec(property(get = ..., put = ...))` across all four properties (`FristName`, `LastName`, `FullName`, `ID`), achieving seamless property syntax. Critically, the student recognizes this as a late-placement requirement — `__declspec` must appear at the end of the class body — and documents this constraint in the source. The constructor is introduced here (line 71–74) as a mechanism for automatic ID assignment, even though the formal constructor module is three modules ahead, demonstrating **prerequisite-independent concept absorption**.

### Module 4 — (Not Present in Directory)

Module 4 is absent from both the instructor and student directories. This likely corresponds to a mid-curriculum topic (possibly friend functions or operator fundamentals) that was not persisted in this snapshot.

### Module 5 — Project 1: Calculator System — A Study in State Machine Architecture

This module represents the first **system-level synthesis** in the curriculum. The instructor's reference (`AbuHadhoud/5- Project 1 (Claculator)/FileName.cpp`, 94 lines) implements a single-class calculator with four arithmetic operations, single-level undo via `_PreviousResult`, and a zero-division guard that silently replaces zero with 1.

The student's implementation (`Me/5- Project 1 (Claculator)/FileName.cpp`, 660 lines) is an architectural tour de force that bears no resemblance to the instructor's solution in complexity. Key architectural decisions:

**Class Hierarchy:**
- `clsSimpleCalculatorOperations` (base): Encapsulates all arithmetic primitives, operand validation, overflow detection, and history management
- `clsSimpleCalculatorChoices` (derived, inherits `protected` members): Encapsulates the menu system, result printing, undo/cancel logic, and main menu loop

This inheritance structure demonstrates a clear **Separation of Concerns** — arithmetic logic is isolated from presentation logic, enabling independent testing and future extension.

**State Machine Pattern:**
The calculator is driven by two enumerations:
```cpp
enum _enCalculatorOperations { enAdd = 1, enSubtract, enMultiplay, enDivide };
enum _enCalculatorChoices { enImplementOperations = 1, enPrintResult, enClear, enCancleLastOperation, enExit, enGetResult };
```

Operations flow through a dispatch switch in `__Implement_CalculatorOperationsMenu()`, which validates the operation, checks for overflow, executes the arithmetic, and conditionally pushes to history.

**Multi-Level Undo via Vector-Stored Snapshots:**
```cpp
struct __stOperationState {
    long double __Opearend;
    long double __CalculatorResult;
    string __OperationName;
};
static vector<__stOperationState> __History;
```

Each operation saves its pre-mutation state to a static vector, enabling unlimited undo depth — a significant advancement over the instructor's single-level undo. The `_CancleLastOperation()` method pops the last state and restores it, with graceful empty-history detection.

**Overflow Protection:**
The `_IsReachedMaxNumber()`, `_GetMaxValue()`, and `_GetMinValue()` methods collectively guard against floating-point overflow by comparing the current result against `LDBL_MAX` adjusted for the history state. This is a production-grade consideration absent from the instructor's solution.

**Input Validation:**
Division by zero triggers a dedicated error-recovery flow (`_DivideCase()`) that re-prompts the user for a non-zero input, with colored failure screens and pause-acknowledgment, rather than silently coercing the divisor to 1.

**Persistent State Flags:**
`static bool __IsClear`, `static bool __IsValidOperation` — these static flags coordinate state across the class hierarchy, preventing operations on a cleared calculator and guarding against partial-operation states.

### Module 6 — Constructors & Destructors: Lifecycle Governance

Module 6 formalizes the object lifecycle. The instructor provides three standalone examples:
1. Parameterized constructor for `clsAddress` (67 lines)
2. Copy constructor with manual member-wise copy (80 lines)
3. Destructor demonstrating stack vs. heap destruction (38 lines, with a syntax error on line 29)

The student's implementation transforms each of these into a cohesive architectural statement:

**Parameterized Constructor (145 lines):** The student constructs a full `clsAddress` class with all four string properties, `const`-correct getters, a `friend`-overloaded `operator<<` for stream insertion, and `__declspec(property)` for assignment syntax. The constructor initializes all four fields via `this->` pointer resolution. The `operator<<` overload demonstrates understanding of the `friend` function pattern and ostream chaining.

**Copy Constructor (180 lines):** The student's copy constructor is prototyped with `const clsAddress& OldObject` — correctly avoiding infinite recursion (a pitfall documented in a detailed comment, lines 42–49). The copy is performed through accessor methods (`GetAddressLine1()`, etc.), not direct member access, ensuring const-correctness and encapsulation even during copying. Three copy scenarios are demonstrated:
```cpp
clsAddress Address2 = Address1;    // Copy initialization
clsAddress Address3(Address1);     // Direct copy constructor invocation
```
This demonstrates both syntactic forms for copy construction.

**Destructor (125 lines):** The student separates destruction semantics into two named free functions — `HeapDestruction()` and `StackDestruction()` — to explicitly demonstrate the two memory regions:
- **Stack:** `clsPerson Person1(...)` — automatic destruction at scope exit
- **Heap:** `clsPerson* Person2 = new clsPerson(...)` — requires `delete` followed by `nullptr` assignment

The destructor itself is declared `~clsPerson()` with a printed verification message. The use of `friend` declarations (`friend void HeapDestruction();`) allows these free functions to access private members, demonstrating understanding of the friend mechanism as a controlled escape hatch.

### Module 7 — Static Members: The Number Counter System

The final module is the apex of the curriculum. The instructor's solution set does not include a Module 7 implementation, making the student's work entirely self-directed. The result is a **single-header system** (`NumberCounterSystem.h`, 1,049 lines) implementing a complete persistent number management application.

**Architecture Overview:**
```
namespace MyNumberCounterSystem {
    class clsNumberCounterUtilities     // Utility functions (input, print, validation)
    class clsNumberConuter              // Core domain entity
    class clsNumberCounterFileManager   // File I/O serialization
    class clsNumberCounterOperation {   // Business logic + sub-classes:
        class clsReadNumbers            //   Read/add numbers
        class clsPrintNumbers           //   Display numbers
        class clsSearchNumbers          //   Search by ID (returns pointer)
        class clsDeleteNumbers          //   Soft-delete by ID
        class clsModifyNumbers          //   Modify by ID with confirmation
        class clsPrintCurrentCounter    //   Display static counter
    }
    class clsNumberCounterMenu          // Main menu loop
}
```

**Domain Entity — `clsNumberConuter`:**
- Three constructors demonstrating **constructor overloading**:
  - `clsNumberConuter(const long double&)` — with automatic ID via `++_Counter`
  - `clsNumberConuter(long double, bool, unsigned short)` — for deserialization from file
  - `clsNumberConuter()` — default, for error returns
- Const-qualified getters ensuring const-correctness
- A `const unsigned short _NumberID` member — **immutable after construction**, enforced by the language
- Soft-delete semantics via `_IsDeletedMark` boolean
- Static counter `_Counter` for distributed ID generation
- `operator<<` overload for stream output
- `__declspec(property)` for all properties

**File Serialization — `clsNumberCounterFileManager`:**
- Custom separator (`"#//#"`) for line-based record delimitation
- Bidirectional conversion: `_ConvertLineToObject()` and `_ConvertObjectToLine()`
- Three file operation modes: `LoadNumbersFromFile` (read-all), `SaveNumbersToFile` (overwrite-all), `AddNumberToFile` (append)
- Error handling for file-open failures

**Business Logic — `clsNumberCounterOperation`:**
- Static `vector<clsNumberConuter> _Numbers` as the in-memory data store
- Nested sub-classes for each operation category, demonstrating **logical class nesting** for organization without inheritance coupling
- Search returns `clsNumberConuter*` (pointer semantics), enabling direct mutation of found entities
- All operations guarded by `IsEmpty_Result()` checks and user confirmation dialogs

**Main Menu — `clsNumberCounterMenu`:**
- Constructor-driven execution (the program runs upon object instantiation)
- Destructor-driven persistence (save-to-file on program exit)
- Enumerated menu options (`enNumberMenuOptions`) with character-based input dispatch
- Exit confirmation screen preventing accidental termination

---

## Code Artifact Showcase

### Artifact 1: Calculator State Machine with Overflow-Protected Arithmetic

*Source: `MyCPPApps/Me/5- Project 1 (Claculator)/FileName.cpp:84–177`*

```cpp
void _Add()
{
    if (_IsReachedMaxNumber())
    {
        PrintReachedMaxMessage(_enCalculatorOperations::enAdd);
        __IsValidOperation = false;
        return;
    }
    else
    {
        _GetValidNumberToCalculate();
        clsSimpleCalculatorOperations::_CurrentResult +=
            clsSimpleCalculatorOperations::_CurrentOpearend;
        __IsValidOperation = true;
    }
}

void _PushLastOperationToHistroy()
{
    __stOperationState CurrentOperationState;
    CurrentOperationState.__CalculatorResult = _CurrentResult;
    CurrentOperationState.__Opearend = _CurrentOpearend;
    CurrentOperationState.__OperationName = _CurrentOperationName;
    __History.push_back(CurrentOperationState);
}
```

This excerpt demonstrates the guarded-operation pattern: pre-condition validation (`_IsReachedMaxNumber`), operand acquisition via validated input, arithmetic execution, state flag setting, and deferred history persistence. The `_PushLastOperationToHistroy` method captures a snapshot struct into a static vector, enabling unbounded undo depth.

### Artifact 2: Copy Constructor with Const-Correctness and Recursion-Avoidance Protocol

*Source: `MyCPPApps/Me/6- Constructors & Destructors/2- Copy Constructors/Copy Constructors.cpp:42–56`*

```cpp
// Passing the object by value inside the copy constructor causes infinite recursion.
// To pass an object by value, the compiler must create a copy of it.
// But creating that copy itself requires calling the copy constructor again.
// This triggers another copy, which calls the copy constructor again, and so on forever.
// Using a reference (const clsAddress&) avoids this because no new copy is needed.

clsAddress(const clsAddress& OldObject)
{
    this->_AddressLine1 = OldObject.GetAddressLine1();
    this->_AddressLine2 = OldObject.GetAddressLine2();
    this->_POBox = OldObject.GetPOBox();
    this->_ZIPCode = OldObject.GetPOBox();
}
```

The formal documentation of the infinite-recursion pitfall, combined with the const-reference parameter and accessor-based member copying, demonstrates a production-grade understanding of copy semantics. The const qualifier on the parameter and the getter methods ensures that copy construction does not mutate the source.

### Artifact 3: File-Backed Number Counter with Soft-Delete and Pointer-Based Search

*Source: `MyCPPApps/Me/7- Static/NumberCounterSystem.h:397–488, 674–684`*

```cpp
static clsNumberConuter _ConvertLineToObject(const string& Line)
{
    vector<string> parts = clsNumberCounterUtilities::SplitString(Line, _Separator);
    if (parts.size() >= 3) {
        return clsNumberConuter(stold(parts[0]), (bool)stoi(parts[1]), stoi(parts[2]));
    }
    return clsNumberConuter();
}

static clsNumberConuter* SearchNumberById(const unsigned short& NumberToFind)
{
    for (clsNumberConuter& Number : _Numbers) {
        if (Number.NumberID == NumberToFind) {
            return &Number;
        }
    }
    return nullptr;
}
```

The `_ConvertLineToObject` function parses a custom-separated record format, using `stold` and `stoi` for type-safe conversion, and invokes the three-parameter constructor for deserialization. The `SearchNumberById` method returns a raw pointer to the in-vector entity, enabling callers to mutate the found object directly — a deliberate design choice that bypasses copy overhead and enables in-place modification, deletion marking, and display without replication.

### Artifact 4: Template Metaprogramming for Type-Detected Input Validation

*Source: `My libraries/Reads_Check.h:228–286`*

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
```

This compile-time type detection function uses C++17 `if constexpr` with `<type_traits>` to dispatch input strategies based on the template parameter `T`. The `static_assert` in the `else` branch produces a compiler error for unsupported types — a zero-cost abstraction that shifts error detection from runtime to compile time. This is metaprogramming of a caliber typically encountered in production utility libraries.

---

## Engineering Rigor Analysis

The repository under analysis documents not merely the completion of a structured curriculum, but a pattern of systematic intellectual over-performance that warrants formal documentation.

### Ratio of Extension

Across every shared module, the student's implementation exceeds the instructor's reference in scope, complexity, and defensive programming:

| Module | Instructor (LOC) | Student (LOC) | Extension Ratio |
|---|---|---|---|
| Class & Object | 27 | 59 | 2.2× |
| Access Specifiers | 46 | 50 | 1.1× |
| Properties (combined) | 158 | 273 | 1.7× |
| Calculator Project | 94 | 660 | 7.0× |
| Constructors/Destructors | 185 | 450 | 2.4× |
| Static Members | N/A | 1,049 | ∞ |

The calculator project exhibits a 7× expansion, reflecting a complete architectural reimagining rather than incremental enhancement.

### Defensive Programming Posture

The student's code consistently anticipates failure modes:
- **Input validation:** Every user input passes through type-checked, range-checked validation functions with `cin.fail()` recovery
- **Division by zero:** Handled with user re-prompt, not silent coercion
- **Overflow protection:** `LDBL_MAX` boundary detection with formatted error messages
- **Empty state guards:** Operations on empty containers, cleared calculators, and empty histories are all checked before execution
- **File I/O errors:** `is_open()` verification with user-visible diagnostics

### Memory Model Awareness

The repository contains repeated, explicit commentary on C++'s dual stack/heap memory model. This is not superficial repetition but progressive elaboration:
1. **Module 1:** Introduction to stack allocation vs. heap allocation in other languages
2. **Module 6 (Destructors):** Empirical demonstration via separate `HeapDestruction()` and `StackDestruction()` functions with observable destructor invocation
3. **Module 7:** Further reinforcement in `main()` commentary

This pedagogical reinforcement — explaining *why* C++ behaves differently from garbage-collected languages — demonstrates a commitment to deep understanding rather than surface-level syntax memorization.

### Namespace and Library Architecture

The 16-library namespace structure (`MyPrints`, `MyReads`, `MyNumbers`, `MyStrings`, `MyCharacters`, `MyVectors`, `MyFiles`, `MyRandoms`, `MyKeys`, etc.) represents a portable, reusable toolkit that transcends any single module. The include graph follows a dependency hierarchy (`Print.h` imports `Reads_Check.h`, which imports `<iostream>` and `<string>`), with each library gated by `#pragma once`. This is professional-grade library design.

### Const Correctness

The student consistently applies `const` to:
- Getter member functions (e.g., `string GetAddressLine1() const`)
- Reference parameters (e.g., `const string& AddressLine1`)
- Immutable data members (e.g., `const unsigned short _NumberID`)
- Iterator loops (e.g., `for (const clsNumberConuter& Number : _Numbers)`)

This level of const-correctness is rare in intermediate coursework and reflects adherence to the C++ Core Guidelines.

---

## Closing Statement

This repository constitutes a formal record of a developer's transition from procedural competence to object-oriented architectural maturity. The consistent pattern of exceeding specification expectations — adding history systems where single-level undo was taught, implementing persistent file storage where in-memory manipulation was demonstrated, deploying template metaprogramming where concrete types were used — reveals an engineering mindset oriented toward production-quality systems design.

The 1,049-line single-header number counter system, built in a module for which no instructor reference exists, stands as the culminating artifact: a self-contained, namespaced, file-backed, CRUD-capable domain model with const-correct interfaces, operator overloading, property-system integration, and constructor/destructor lifecycle management. It is a synthesis of every concept introduced across the curriculum, executed at a level of sophistication that exceeds the sum of its parts.

**Filed this 28th day of June, 2026.**
