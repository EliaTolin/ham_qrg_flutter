# Repository Guidelines

## Project Structure & Module Organization
The Flutter entry point lives in `lib/main.dart`, while feature code is under `lib/src/` with supporting modules in `lib/clients`, `lib/common`, and `lib/router`. Shared configuration and themes are in `lib/config` and `lib/themes`. Localized assets reside in `assets/` (`assets/images`, `assets/svg`, `assets/icon`) and localization bundles in `lib/l10n`. Platform-specific scaffolding stays in `android/` and `ios/`, documentation in `docs/`, and widget/unit tests in `test/`. Keep new modules aligned with this layout to avoid duplication.

## Build, Test, and Development Commands
- `flutter pub get` – Sync Dart dependencies defined in `pubspec.yaml`.
- `flutter run` – Launch the app on the connected device or simulator for smoke testing.
- `flutter test` – Execute the test suite (currently seeded by `test/hello_test.dart`); add `--coverage` before publishing releases.
- `flutter analyze` – Run static analysis with the `very_good_analysis` ruleset; treat warnings as actionable.
- `dart format lib test` – Apply Dart formatting before opening a PR.

## Coding Style & Naming Conventions
This project inherits linting from `analysis_options.yaml`, which extends `very_good_analysis`. Use two-space indentation, prefer `const` constructors, and avoid unused imports. Class names and enums use `UpperCamelCase`; variables, methods, and parameters use `lowerCamelCase`; files and directories stick to `snake_case.dart`. Keep widgets small, split shared UI into `lib/common`, and route definitions inside `lib/router`.

## Testing Guidelines
Place unit, widget, and integration helpers in `test/`, mirroring the structure under `lib/`. Name files `*_test.dart`, and group related cases using `group()` to keep output readable. Add golden or integration coverage when touching UI-heavy features, and ensure `flutter test --coverage` passes locally before requesting review. When stubbing services, leverage fake clients inside `lib/clients` to keep tests deterministic.

## Commit & Pull Request Guidelines
Follow the observed convention of prefixing commit summaries (e.g., `dev: update quiz flow`); keep the first line under 72 characters. Each commit should compile and pass `flutter analyze`. Pull requests must include a concise summary of the change, screenshots or recordings for UI adjustments, and links to related issues or tickets. Note any follow-up work or tech debt in the PR description so reviewers can consider scope adjustments.

## Security & Configuration Tips
Never commit credentials; sensitive configuration belongs in private `.env` files and must not enter version control. Update `sentry.properties` and `shorebird.yaml` only with verified keys, and reset tokens immediately if they leak. When consuming remote APIs, funnel requests through the existing client abstractions to centralize authentication and logging.
