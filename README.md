# E2B Dictionary - Modern Flutter Application

## Disclaimer
This project is created strictly for educational and learning purposes only.  
The content, code, and information provided in this repository may be incomplete, incorrect, or outdated.  
It is **not intended for commercial use, redistribution, or monetization** in any form.

You are free to explore, modify, and learn from the source code, but you **must not use it for commercial, promotional, or revenue-generating activities** (such as publishing, selling, or integrating ads/monetization features) without explicit permission from the author.

The author makes no guarantees regarding the accuracy, performance, or reliability of the information or software.

---

## Overview
E2B Dictionary is a English-Bangla dictionary application built with Flutter, designed to help users expand their vocabulary through an intuitive and visually appealing interface.  
The app follows **MVVM architecture** and implements **clean code principles**, making it maintainable and scalable.

---

## Core Functionality
- **Word Database:** Access thousands of words with detailed definitions.
- **Search:** Real-time search with instant filtering and suggestions.
- **Favorites System:** Save words for quick access and offline learning.
- **Word Details:**
  - Word definition and meaning
  - Parts of speech (noun, verb, adjective, etc.)
  - Usage examples in context
  - Favorite status management
- **Offline First:** Works without internet connection.
- **SQLite Database:** Efficient local data storage.
- **State Management:** GetX for reactive state handling.
- **Clean Architecture:** MVVM pattern with clear separation of concerns.
- **Dependency Injection:** Proper DI using GetX bindings.

---

## Architecture
**MVVM + Clean Architecture**  
The app follows a layered architecture approach ensuring separation of concerns and maintainability.

---

## Project Structure
```text
English-Bangla-Dictionary-SQLite/
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── theme/
│   │   │   └── app_theme.dart
│   │   ├── routes/
│   │   │   └── app_routes.dart
│   │   └── bindings/
│   │       ├── initial_binding.dart
│   │       ├── home_binding.dart
│   │       ├── favorites_binding.dart
│   │       └── settings_binding.dart
│   ├── data/
│   │   ├── models/
│   │   │   └── word_model.dart
│   │   ├── datasources/
│   │   │   └── local/
│   │   │       └── database_helper.dart
│   │   └── repositories/
│   │       └── dictionary_repository_impl.dart
│   ├── domain/
│   │   ├── entities/
│   │   │   └── word_entity.dart
│   │   ├── repositories/
│   │   │   └── dictionary_repository.dart
│   │   └── usecases/
│   │       ├── get_words_usecase.dart
│   │       ├── get_favorites_usecase.dart
│   │       ├── update_favorite_usecase.dart
│   │       └── search_words_usecase.dart
│   └── presentation/
│       ├── screens/
│       │   ├── splash/
│       │   │   └── splash_screen.dart
│       │   ├── main/
│       │   │   └── main_screen.dart
│       │   ├── home/
│       │   │   └── home_screen.dart
│       │   ├── favorites/
│       │   │   └── favorites_screen.dart
│       │   ├── settings/
│       │   │   └── settings_screen.dart
│       │   └── word_detail/
│       │       └── word_detail_screen.dart
│       ├── viewmodels/
│       │   ├── home_viewmodel.dart
│       │   ├── favorites_viewmodel.dart
│       │   └── settings_viewmodel.dart
│       └── widgets/
│           ├── word_card.dart
│           ├── search_bar_widget.dart
│           ├── animated_gradient_background.dart
│           └── empty_state.dart
├── assets/
│   └── dictionary.db
├── pubspec.yaml
└── README.md

```

📱 App Screenshots
<p align="center"> <img src="https://github.com/nmustakim/English-Bangla-Dictionary-SQLite/blob/main/screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202025-11-01%20at%2014.21.11.png?raw=true" width="180"/> <img src="https://github.com/nmustakim/English-Bangla-Dictionary-SQLite/blob/main/screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202025-11-01%20at%2014.21.17.png?raw=true" width="180"/> <img src="https://github.com/nmustakim/English-Bangla-Dictionary-SQLite/blob/main/screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202025-11-01%20at%2014.21.39.png?raw=true" width="180"/> <img src="https://github.com/nmustakim/English-Bangla-Dictionary-SQLite/blob/main/screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202025-11-01%20at%2014.22.48.png?raw=true" width="180"/> </p> <p align="center"> <img src="https://github.com/nmustakim/English-Bangla-Dictionary-SQLite/blob/main/screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202025-11-01%20at%2014.22.58.png?raw=true" width="180"/> <img src="https://github.com/nmustakim/English-Bangla-Dictionary-SQLite/blob/main/screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202025-11-01%20at%2014.23.07.png?raw=true" width="180"/> <img src="https://github.com/nmustakim/English-Bangla-Dictionary-SQLite/blob/main/screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202025-11-01%20at%2014.23.09.png?raw=true" width="180"/> <img src="https://github.com/nmustakim/English-Bangla-Dictionary-SQLite/blob/main/screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202025-11-01%20at%2014.25.24.png?raw=true" width="180"/> </p> 