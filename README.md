# TMA Modal

A Flutter project that replicates a **Telegram Mini App-like modal** with a **draggable, bottom-anchored bottom sheet**, integrated **WebView**, and interactive controls. The modal supports **three states**: collapsed (10% height), half-expanded (50% height), and full-expanded (100% height).

---

## Features

- **Draggable Modal**  
  Smoothly drag the modal to adjust its height, with snapping to predefined states based on drag velocity or position.  

- **WebView Integration**  
  Load URLs directly in the modal with loading indicators and error handling.  

- **State Management**  
  Uses `flutter_bloc` for robust management of modal states and user interactions.  

- **Cross-Platform**  
  Fully optimized for **iOS** and **Android**, with proper WebView configurations for each platform.  

---

## Project Architecture

The project follows **clean architecture principles**, separating concerns between:

- **Domain Layer** – business logic and entities  
- **Presentation Layer** – UI, state management, and modal interactions  

---

## Installation

1. Ensure your `pubspec.yaml` includes the required dependencies:

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
````

2. Install dependencies:

```bash
flutter pub get
```

---

## Running the App

1. Connect a physical device or start an emulator.
2. Run the app:

```bash
flutter run
```

---
