---
description: SOP for creating a new feature using Clean Architecture in Tarombo
---

# SOP: Create New Feature (Clean Architecture)

Follow these steps strictly whenever a new feature is requested.

## 1. Directory Structure
Create the following structure for `lib/features/[feature_name]/`:

```text
[feature_name]/
 ├── data/
 │    ├── datasources/
 │    ├── models/
 │    ├── repositories/
 │    └── mappers/
 ├── domain/
 │    ├── entities/
 │    ├── repositories/
 │    └── usecases/
 └── presentation/
      ├── bloc/
      ├── pages/
      └── widgets/
```

## 2. Core Principles

### Domain Layer (The Heart)
- **Entities**: Pure Dart classes. No JSON serialization here. No imports from `data` or `presentation`.
- **Repository Interface**: Define abstract classes for data operations.
- **UseCases**: Single-purpose classes (e.g., `GetLineage`). Must call a Repository.

### Data Layer (Implementation)
- **Models**: Extends entities or provides `toEntity()` methods. Handles `fromJson`/`toJson`.
- **DataSources**: Prefer 2 files: `[feature]_data_source.dart` (interface) and `[feature]_data_source_impl.dart` (implementation). If multiple distinct sources exist (e.g. Remote vs Local), they can be separated within this folder.
- **Repositories**: Implementation of domain repository interfaces.
- **Error Mapping**: Catch exceptions and use `exception.toFailure()` before returning to Domain.

### Presentation Layer (UI)
- **State Management**: Use Bloc/Cubit. 
  - **No Business Logic**: Call UseCases only.
  - **Lean State**: Only UI-relevant data.
- **Pages**: Top-level screens. Use `BlocProvider` here.
- **Widgets**: Extracted components. No business logic or complex comparisons in `build`.
- **Listeners**: Side effects (Navigation, Dialogs, Snackbars) MUST be in a `BlocListener`, extracted into a private method (e.g., `_onStateListener`).

## 3. Error Handling Standard
- Use `sealed class Failure` for domain errors.
- Use pattern matching in the UI to handle different Failure types.
- Ensure all repository implementations use the `FailureMapper` extension (`.toFailure()`).

## 4. UI Aesthetics
- Use premium design system tokens.
- No plain colors; use gradients, `withValues`, and harmonious palettes.
- Subtle animations and hover effects for interactivity.

// turbo
## 5. Verification
Run `flutter analyze` after creating the feature to ensure 0 lint issues.
