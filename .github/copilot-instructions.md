<!-- Auto-generated: guidance for AI coding agents working on hungry_app -->
# Copilot / AI agent instructions — hungry_app

Summary
- Short: Flutter mobile app (hunry_app) with feature-based `lib/features/`, shared UI in `lib/shared/`, and a small `lib/core/` for constants/utilities.

What to know first
- Entry points: `lib/main.dart` currently creates the `MaterialApp` and starts at `LoginView`. There is also `lib/root.dart` which returns its own `MaterialApp` — avoid duplicate MaterialApp instances; prefer a single app root (`main.dart`) and move routing/theme there.
- Shared widgets: `lib/shared/` contains UI building blocks (`custom_button.dart`, `custom_textfield.dart`, `custom_text.dart`) used across features.
- Feature layout: `lib/features/<feature>/views/...` holds screens (e.g., `features/auth/views/login_view.dart`). Keep logic in feature folders and reusable UI/logic in `shared/` or `core/`.

Concrete patterns & gotchas (extractable from code)
- TextEditingController usage: `LoginView` and `SignupView` currently define controllers as fields inside a `StatelessWidget`. This leaks resources because `StatelessWidget` can't dispose controllers. Fix: convert these screens to `StatefulWidget` and dispose controllers in `State.dispose()`.
  - Example: move `TextEditingController emailController = TextEditingController();` into state and call `emailController.dispose()`.
- Form keys: `GlobalKey<FormState>` used in views — keep with the widget state for proper validation lifecycle.
- Theme & colors: central `AppColors` exists at `lib/core/constants/app_colors.dart`. Prefer referencing `AppColors` for consistent theming.
- Empty core files: several network and util files under `lib/core/` are empty (`api_service.dart`, `api_exceptions.dart`, `helpers.dart`, `validators.dart`, `api_endpoints.dart`, `app_strings.dart`). Implement or remove them; for API work, place HTTP logic in `core/network/api_service.dart` and surface typed exceptions from `api_exceptions.dart`.

Build / test / debug commands (Windows PowerShell)
- Install dependencies:
```powershell
flutter pub get
```
- Analyze code and lints:
```powershell
flutter analyze
```
- Run app (select device/emulator first):
```powershell
flutter run -d <device-id>
```
- Run unit/widget tests if present:
```powershell
flutter test
```

Project-specific coding conventions
- Keep UI widgets (stateless UI-only) in `shared/` and screen state/logic inside `features/.../views` or `features/.../controllers` (if added).
- Use `AppColors` for color constants and add other constants to `lib/core/constants/app_strings.dart` and `api_endpoints.dart` (currently empty).
- Use `flutter_svg` for SVG assets (project already imports it and uses `assets/logo/logo.svg`). Ensure `pubspec.yaml` assets include all referenced asset paths (it currently includes `assets/` which is broad and acceptable).
- Prefer `const` constructors where possible to reduce rebuild costs.

Security & network notes
- There is no implemented `api_service.dart` yet. When implementing:
  - Use `dart:async` + `http` or `dio` and centralize base URL and endpoints in `api_endpoints.dart`.
  - Map HTTP errors to typed exceptions in `api_exceptions.dart` for predictable handling in UI.

Quick fixes to improve code quality now
- Fix controller disposal: convert `LoginView` and `SignupView` to `StatefulWidget` and dispose controllers.
- Remove duplicate `MaterialApp` (`lib/root.dart`) or refactor to provide a `Root` widget that the `main` entry uses (e.g., `home: Root()` in `main.dart`).
- Add implementations or TODOs inside empty `lib/core/*` files or delete unused files to reduce confusion.
- Run `flutter analyze` and fix all lints from `flutter_lints` (project uses `flutter_lints` in `dev_dependencies`).
- Add small unit tests for form validation logic in `features/auth/`.

Files to inspect first when making changes
- `lib/main.dart`, `lib/root.dart` — app root and routing
- `lib/features/auth/views/login_view.dart`, `signup_view.dart` — controllers & form code
- `lib/shared/*` — shared widgets for consistent updates
- `lib/core/*` — implement or remove empty utility and network files
- `pubspec.yaml` — verify asset and dependency lists

If you need me to implement the highest-value fixes, I can:
- Convert `LoginView` and `SignupView` to `StatefulWidget` and add disposals.
- Consolidate the app root (choose `main.dart` or `root.dart`).
- Add a minimal `api_service.dart` skeleton and wire `api_endpoints.dart`.

End of file — ask for which fix to start with.
