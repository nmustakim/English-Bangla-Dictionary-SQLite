
⚠️ Disclaimer
This project is created strictly for educational and learning purposes only.
The content, code, and information provided in this repository may be incomplete, incorrect, or outdated.
It is not intended for commercial use, redistribution, or monetization in any form.
You are free to explore, modify, and learn from the source code, but you must not use it for commercial, promotional, or revenue-generating activities (such as publishing, selling, or integrating ads/monetization features) without explicit permission from the author.
The author makes no guarantees regarding the accuracy, performance, or reliability of the information or software.

📖 E2B Dictionary - Modern Flutter Application
<div>
A beautifully crafted dictionary application featuring clean architecture, modern UI/UX, and smooth animations.
Features • Screenshots • Installation • Architecture • Documentation
</div>
📱 Overview
E2B Dictionary is a comprehensive English dictionary application built with Flutter, designed to help users expand their vocabulary through an intuitive and visually appealing interface. The app follows industry-standard MVVM architecture and implements clean code principles, making it maintainable, scalable, and production-ready.
  Project Goals
  Provide instant access to word definitions, meanings, and examples
  Enable users to save favorite words for quick reference
  Offer customizable reading experience with adjustable fonts and themes
  Deliver smooth, responsive UI with delightful animations
  Implement offline-first approach with local database
  Follow Flutter best practices and clean architecture principles
  Features
  Core Functionality
Comprehensive Word Database: Access thousands of words with detailed definitions
Smart Search: Real-time search with instant filtering and suggestions
Favorites System: Save words for quick access and offline learning
Word Details: View complete information including:
Word definition and meaning
Parts of speech (noun, verb, adjective, etc.)
Usage examples in context
Favorite status management
🎨 User Experience
Modern UI/UX: Material Design 3 with custom theming
Dark Mode: Seamless switching between light and dark themes
Smooth Animations: Engaging transitions and micro-interactions
Gradient Backgrounds: Dynamic animated gradients
Empty States: Helpful guidance when no content is available
Loading States: Progress indicators during data operations
Error Handling: User-friendly error messages with retry options
 Customization
Font Size Controls: Adjustable title and body font sizes
Theme Preferences: Persistent theme selection (light/dark)
Settings Persistence: Preferences saved locally using SharedPreferences
Reset Options: Quick reset to default settings
 Technical Features
Offline First: Works without internet connection
SQLite Database: Efficient local data storage
State Management: GetX for reactive state handling
Clean Architecture: MVVM pattern with clear separation of concerns
Dependency Injection: Proper DI using GetX bindings
Null Safety: Full null-safe Dart implementation
 Architecture
MVVM + Clean Architecture
The app follows a layered architecture approach ensuring separation of concerns and maintainability:
┌─────────────────────────────────────────────────┐
│          PRESENTATION LAYER                      │
│  ┌──────────────┐  ┌──────────────┐            │
│  │   Screens    │  │   Widgets    │            │
│  └──────────────┘  └──────────────┘            │
│  ┌─────────────────────────────────────┐       │
│  │         ViewModels (State)          │       │
│  └─────────────────────────────────────┘       │
└─────────────────────────────────────────────────┘
                       ↓↑
┌─────────────────────────────────────────────────┐
│             DOMAIN LAYER                         │
│  ┌──────────────┐  ┌──────────────┐            │
│  │   Entities   │  │  Use Cases   │            │
│  └──────────────┘  └──────────────┘            │
│  ┌─────────────────────────────────────┐       │
│  │    Repository Interfaces            │       │
│  └─────────────────────────────────────┘       │
└─────────────────────────────────────────────────┘
                       ↓↑
┌─────────────────────────────────────────────────┐
│              DATA LAYER                          │
│  ┌──────────────┐  ┌──────────────┐            │
│  │    Models    │  │  DataSources │            │
│  └──────────────┘  └──────────────┘            │
│  ┌─────────────────────────────────────┐       │
│  │  Repository Implementations         │       │
│  └─────────────────────────────────────┘       │
└─────────────────────────────────────────────────┘
Layer Responsibilities
Presentation Layer
Screens: UI components and layout
Widgets: Reusable UI elements
ViewModels: State management and business logic coordination
Bindings: Dependency injection configuration
Domain Layer (Business Logic)
Entities: Business objects (independent of frameworks)
Use Cases: Single-responsibility business operations
Repository Interfaces: Abstract data access contracts
Data Layer
Models: Data transfer objects
DataSources: Database and API implementations
Repository Implementations: Data access logic
Benefits
 Testability: Each layer can be tested independently
 Maintainability: Changes in one layer don't affect others
 Scalability: Easy to add new features without breaking existing code
 Reusability: Components can be shared across features
 Separation of Concerns: Clear responsibilities for each component
 Project Structure
e2b_dictionary/
│
├── lib/
│   ├── main.dart                              # Application entry point
│   │
│   ├── core/                                  # Core functionality
│   │   ├── theme/
│   │   │   └── app_theme.dart                 # Theme configuration & colors
│   │   ├── routes/
│   │   │   └── app_routes.dart                # Navigation & routing
│   │   └── bindings/
│   │       ├── initial_binding.dart           # App-level dependencies
│   │       ├── home_binding.dart              # Home screen dependencies
│   │       ├── favorites_binding.dart         # Favorites dependencies
│   │       └── settings_binding.dart          # Settings dependencies
│   │
│   ├── data/                                  # Data layer
│   │   ├── models/
│   │   │   └── word_model.dart                # Word data model
│   │   ├── datasources/
│   │   │   └── local/
│   │   │       └── database_helper.dart       # SQLite operations
│   │   └── repositories/
│   │       └── dictionary_repository_impl.dart # Repository implementation
│   │
│   ├── domain/                                # Business logic layer
│   │   ├── entities/
│   │   │   └── word_entity.dart               # Word business entity
│   │   ├── repositories/
│   │   │   └── dictionary_repository.dart     # Repository interface
│   │   └── usecases/
│   │       ├── get_words_usecase.dart         # Fetch all words
│   │       ├── get_favorites_usecase.dart     # Fetch favorite words
│   │       ├── update_favorite_usecase.dart   # Update favorite status
│   │       └── search_words_usecase.dart      # Search functionality
│   │
│   └── presentation/                          # UI layer
│       ├── screens/
│       │   ├── splash/
│       │   │   └── splash_screen.dart         # App splash screen
│       │   ├── main/
│       │   │   └── main_screen.dart           # Main navigation screen
│       │   ├── home/
│       │   │   └── home_screen.dart           # Home word list
│       │   ├── favorites/
│       │   │   └── favorites_screen.dart      # Favorites list
│       │   ├── settings/
│       │   │   └── settings_screen.dart       # App settings
│       │   └── word_detail/
│       │       └── word_detail_screen.dart    # Word details view
│       │
│       ├── viewmodels/
│       │   ├── home_viewmodel.dart            # Home screen state
│       │   ├── favorites_viewmodel.dart       # Favorites state
│       │   └── settings_viewmodel.dart        # Settings state
│       │
│       └── widgets/
│           ├── word_card.dart                 # Word list item
│           ├── search_bar_widget.dart         # Search input
│           ├── animated_gradient_background.dart # Animated background
│           └── empty_state.dart               # Empty state component
│
├── assets/
│   └── dictionary.db                          # SQLite database file
│
├── pubspec.yaml                               # Dependencies & configuration
└── README.md                                  # This file
🚀 Installation
Prerequisites
Flutter SDK: 3.0.0 or higher
Dart SDK: 3.0.0 or higher
Android Studio / VS Code with Flutter extensions
iOS Simulator / Android Emulator / Physical Device
Step-by-Step Setup
1. Clone the Repository
bash
git clone https://github.com/yourusername/e2b-dictionary.git
cd e2b-dictionary
2. Install Dependencies
bash
flutter pub get
3. Database Setup
Create or place your dictionary.db file in the assets/ folder with this schema:
sql
CREATE TABLE Dictionary (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    word TEXT NOT NULL,
    meaning TEXT NOT NULL,
    partsOfSpeech TEXT NOT NULL,
    example TEXT NOT NULL,
    isFavorite INTEGER DEFAULT 1
);
Important Notes:
isFavorite uses SQLite convention: 0 = favorite, 1 = not favorite
Ensure assets/dictionary.db is listed in pubspec.yaml under assets
4. Run the Application
bash
# Debug mode
flutter run

# Release mode (optimized)
flutter run --release

# Specific device
flutter run -d <device_id>
Build for Production
   Android APK:
   bash
   flutter build apk --release
   Android App Bundle:
   bash
   flutter build appbundle --release
   iOS:
   bash
   flutter build ios --release