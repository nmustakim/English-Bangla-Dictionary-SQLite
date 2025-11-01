## Disclaimer

This project is created strictly for educational and learning purposes only.  
The content, code, and information provided in this repository may be incomplete, incorrect, or outdated.  
It is not intended for commercial use, redistribution, or monetization in any form.

You are free to explore, modify, and learn from the source code, but you must not use it for commercial, promotional, or revenue-generating activities (such as publishing, selling, or integrating ads/monetization features) without explicit permission from the author.

The author makes no guarantees regarding the accuracy, performance, or reliability of the information or software.

---

# E2B Dictionary - Modern Flutter Application

A beautifully crafted dictionary application featuring clean architecture, modern UI/UX, and smooth animations.

**Sections:** Features • Screenshots • Installation • Architecture • Documentation

---

## Overview

E2B Dictionary is a comprehensive English dictionary application built with Flutter, designed to help users expand their vocabulary through an intuitive and visually appealing interface.  
The app follows industry-standard MVVM architecture and implements clean code principles, making it maintainable, scalable, and production-ready.

---

### Project Goals

- Provide instant access to word definitions, meanings, and examples
- Enable users to save favorite words for quick reference
- Offer customizable reading experience with adjustable fonts and themes
- Deliver smooth, responsive UI with delightful animations
- Implement offline-first approach with local database
- Follow Flutter best practices and clean architecture principles

---

## Features

### Core Functionality

- **Comprehensive Word Database:** Access thousands of words with detailed definitions
- **Smart Search:** Real-time search with instant filtering and suggestions
- **Favorites System:** Save words for quick access and offline learning
- **Word Details:**
    - Word definition and meaning
    - Parts of speech (noun, verb, adjective, etc.)
    - Usage examples in context
    - Favorite status management

### User Experience

- **Modern UI/UX:** Material Design 3 with custom theming
- **Dark Mode:** Seamless switching between light and dark themes
- **Smooth Animations:** Engaging transitions and micro-interactions
- **Gradient Backgrounds:** Dynamic animated gradients
- **Empty States:** Helpful guidance when no content is available
- **Loading States:** Progress indicators during data operations
- **Error Handling:** User-friendly error messages with retry options

### Customization

- **Font Size Controls:** Adjustable title and body font sizes
- **Theme Preferences:** Persistent theme selection (light/dark)
- **Settings Persistence:** Preferences saved locally using SharedPreferences
- **Reset Options:** Quick reset to default settings

### Technical Features

- **Offline First:** Works without internet connection
- **SQLite Database:** Efficient local data storage
- **State Management:** GetX for reactive state handling
- **Clean Architecture:** MVVM pattern with clear separation of concerns
- **Dependency Injection:** Proper DI using GetX bindings

---

## Architecture

### MVVM + Clean Architecture

The app follows a layered architecture approach ensuring separation of concerns and maintainability:


---

## Project Structure

e2b_dictionary/
│
├── lib/
│ ├── main.dart
│ ├── core/
│ │ ├── theme/
│ │ │ └── app_theme.dart
│ │ ├── routes/
│ │ │ └── app_routes.dart
│ │ └── bindings/
│ │ ├── initial_binding.dart
│ │ ├── home_binding.dart
│ │ ├── favorites_binding.dart
│ │ └── settings_binding.dart
│ │
│ ├── data/
│ │ ├── models/
│ │ │ └── word_model.dart
│ │ ├── datasources/
│ │ │ └── local/
│ │ │ └── database_helper.dart
│ │ └── repositories/
│ │ └── dictionary_repository_impl.dart
│ │
│ ├── domain/
│ │ ├── entities/
│ │ │ └── word_entity.dart
│ │ ├── repositories/
│ │ │ └── dictionary_repository.dart
│ │ └── usecases/
│ │ ├── get_words_usecase.dart
│ │ ├── get_favorites_usecase.dart
│ │ ├── update_favorite_usecase.dart
│ │ └── search_words_usecase.dart
│ │
│ └── presentation/
│ ├── screens/
│ │ ├── splash/splash_screen.dart
│ │ ├── main/main_screen.dart
│ │ ├── home/home_screen.dart
│ │ ├── favorites/favorites_screen.dart
│ │ ├── settings/settings_screen.dart
│ │ └── word_detail/word_detail_screen.dart
│ │
│ ├── viewmodels/
│ │ ├── home_viewmodel.dart
│ │ ├── favorites_viewmodel.dart
│ │ └── settings_viewmodel.dart
│ │
│ └── widgets/
│ ├── word_card.dart
│ ├── search_bar_widget.dart
│ ├── animated_gradient_background.dart
│ └── empty_state.dart
│
├── assets/
│ └── dictionary.db
│
├── pubspec.yaml
└── README.md