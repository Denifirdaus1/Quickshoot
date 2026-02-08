# Quickshoot

## Project Overview

Quickshoot is an industry-grade Flutter application designed to help users find and book photographers. It features a modern, clean architecture and utilizes robust libraries for state management, navigation, and UI effects.

## Tech Stack

*   **Framework:** Flutter
*   **Language:** Dart
*   **State Management:** `flutter_riverpod` (using code generation)
*   **Navigation:** `go_router`
*   **Data Models:** `freezed`, `json_serializable`
*   **Maps:** `flutter_map` (OpenStreetMap)
*   **UI Effects:** `flutter_animate`
*   **Linting:** `flutter_lints`

## Project Structure

The project follows a Clean Architecture pattern, organized by features:

*   **`lib/main.dart`**: Application entry point. Sets up `ProviderScope`.
*   **`lib/app/`**: Core application configuration.
    *   `app.dart`: Main `App` widget, configures `MaterialApp` and themes.
    *   `router/app_router.dart`: `GoRouter` configuration defining routes (`/splash`, `/home`, `/map-of-photography`).
*   **`lib/core/`**: Shared resources.
    *   `constants/`: Application constants.
    *   `themes/`: Theme definitions (`AppTheme`).
*   **`lib/features/`**: Feature-specific code.
    *   `home/`: Home screen logic and UI (contains `HomePage`, `MapOfPhotographyPage`).
    *   `splash/`: Splash screen.

## Key Features

*   **Photography Map:** Interactive map to find photographers nearby.
*   **3D Carousel:** Visually engaging carousel on the home page to showcase photographers.
*   **Theming:** Support for light and dark modes (system-aware).

## Building and Running

### Prerequisites

*   Flutter SDK (version ^3.10.3)
*   Dart SDK

### Commands

*   **Get Dependencies:**
    ```bash
    flutter pub get
    ```

*   **Run Development Server:**
    ```bash
    flutter run
    ```

*   **Run Code Generation (Runner):**
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

*   **Run Code Generation (Watcher):**
    ```bash
    dart run build_runner watch --delete-conflicting-outputs
    ```

*   **Analyze Code:**
    ```bash
    flutter analyze
    ```

*   **Run Tests:**
    ```bash
    flutter test
    ```

## Development Conventions

*   **Linting:** The project uses `flutter_lints` for static analysis. Ensure code passes analysis before committing.
*   **Code Generation:** Models and providers often use code generation (`freezed`, `riverpod_generator`). Remember to run `build_runner` after modifying annotated classes.
*   **Routing:** Use `go_router` for all navigation. Define new routes in `lib/app/router/app_router.dart`.
*   **Theming:** Use `AppTheme` in `lib/core/themes/app_theme.dart` for styling consistency.
