# TMA Modal

A Flutter project implementing a Telegram Mini App-like modal with a bottom-anchored, draggable bottom sheet, a WebView for loading URLs, and interactive controls (Close/Collapse buttons). The modal supports three states: collapsed (10% height), half-expanded (50% height), and full-expanded (100% height).

## Features
- **Draggable Modal**: Smoothly drag the modal to adjust its height, snapping to predefined states based on drag velocity or position.
- **WebView Integration**: Loads a URL in a WebView with loading indicators and error handling.
- **State Management**: Uses `flutter_bloc` for robust state management of modal states and interactions.
- **Cross-Platform**: Optimized for both iOS and Android with proper WebView configurations.

## Project Architecture
The project follows a clean architecture with separation of concerns, organized into **Domain** and **Presentation** layers.

### Folder Structure

lib/├── main.dart                    # App entry point├── domain/│   └── entities/│       └── modal_entity.dart    # ModalEntity and ModalViewState enum├── presentation/│   ├── blocs/│   │   └── modal/│   │       ├── modal_bloc.dart  # BLoC for modal state management│   │       ├── events/│   │       │   └── modal_event.dart  # Modal events (Open, Drag, Collapse, Close)│   │       └── states/│   │           └── modal_state.dart  # Modal states (Initial, Loading, Open, Error)│   ├── screens/│   │   └── home_screen.dart      # Main screen with modal trigger│   └── widgets/│       ├── custom_modal.dart     # Modal UI with drag handling│       ├── drag_handle.dart      # Visual drag handle│       ├── modal_header.dart     # Header with Close/Collapse buttons│       └── web_view_container.dart  # WebView for URL displaypubspec.yaml                     # Dependencies and project config

## Install Dependencies
Ensure `pubspec.yaml` includes the required dependencies:
```yaml
name: tma_modal
description: A Flutter app with a Telegram Mini App-like modal.
version: 1.0.0
environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
  webview_flutter: ^4.4.2
  equatable: ^2.0.5

flutter:
  uses-material-design: true

Run:
flutter pub get

Run the App
Connect an emulator or device, then run:
flutter run



