# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Development Commands

```bash
# Dependencies
flutter pub get

# Code generation (REQUIRED after modifying @riverpod or @freezed classes)
dart run build_runner build --delete-conflicting-outputs

# Localization (after editing lib/l10n/app_it.arb)
flutter gen-l10n

# Run app
flutter run

# Analysis & formatting
flutter analyze
dart format lib test

# Testing
flutter test
flutter test --coverage
```

## Architecture Overview

This is a Flutter app for ham radio repeater discovery using **Clean Architecture** with **Riverpod** for state management.

### Feature Structure
Each feature follows this strict hierarchy:
```
lib/src/features/[feature]/
├── data/
│   ├── datasource/      # Abstract interface + Supabase implementation
│   ├── model/           # DTOs with @freezed + fromJson
│   ├── mappers/         # Model ↔ Entity converters
│   └── repository/      # Business logic, returns domain entities
├── domain/              # @freezed entities (no JSON methods)
├── presentation/
│   └── [page_name]/
│       ├── controller/  # @riverpod notifier
│       │   └── state/   # @freezed state class
│       └── [page_name]_page.dart
├── provider/            # Action-specific providers
└── errors/              # Feature-specific exceptions
```

### Key Patterns

**State Management**: Riverpod with annotations
- Controllers extend `_$[PageName]Controller` (generated)
- Use `AsyncValue.guard()` for error/loading handling
- Each page has its own controller and state (no sharing)

**Data Flow**: Datasource → Repository → Provider → Controller → Page
- Datasources return Models (DTOs)
- Repositories convert Models to Domain Entities
- Pages receive only primitive IDs, not entities

**Pages**: Use `HookConsumerWidget` with `@RoutePage()` annotation
```dart
final controller = ref.watch(pageNameControllerProvider);
return controller.when(data: ..., error: ..., loading: ...);
```

## Localization Rules

File: `lib/l10n/app_it.arb` (template)
- **Keys**: ALWAYS in English (camelCase)
- **Values**: ALWAYS in Italian
- Pattern: `[feature][element]` (e.g., `homeQuickAccess`, `repeaterDetails`)

## Backend & Services

- **Supabase**: Database, authentication (Google, Apple, Anonymous)
- **Mapbox**: Interactive maps with repeater markers
- **Sentry**: Error tracking

## Repeater Domain Model

Core entities in `lib/src/features/repeaters/domain/`:
- **Repeater**: frequencyHz, mode (Analog/Digital/Mixed), accesses list, coordinates
- **RepeaterAccess**: mode enum, CTCSS tones (ctcssTxHz/ctcssRxHz), DMR params (colorCode, dmrId), network reference
- **Network**: name, kind (DMR network like BrandMeister, TGIF)
- **RepeaterFeedback**: user reviews with type, station kind, location

## Access Mode Colors

Defined in `lib/themes/app_colors.dart` and `lib/common/utils/access_mode_helper.dart`:
- Analog: Blue (#3B82F6)
- DMR: Purple (#A855F7)
- C4FM: Teal (#14B8A6)
- D-STAR: Orange (#FF6B35)

## Coding Conventions

- Files/directories: `snake_case`
- Classes: `UpperCamelCase`
- Variables/methods: `lowerCamelCase`
- Analysis: extends `very_good_analysis`
- Generated files excluded: `*.g.dart`, `*.freezed.dart`

## Commit Convention

Prefix format: `[type]: [description]`
- Examples: `dev:`, `refactor:`, `fix:`, `feat:`
- Each commit must pass `flutter analyze`
