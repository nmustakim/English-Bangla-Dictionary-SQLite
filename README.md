English-Bangla-Dictionary-SQLite/
│
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── theme/app_theme.dart
│   │   ├── routes/app_routes.dart
│   │   └── bindings/
│   │       ├── initial_binding.dart
│   │       ├── home_binding.dart
│   │       ├── favorites_binding.dart
│   │       └── settings_binding.dart
│   │
│   ├── data/
│   │   ├── models/word_model.dart
│   │   ├── datasources/local/database_helper.dart
│   │   └── repositories/dictionary_repository_impl.dart
│   │
│   ├── domain/
│   │   ├── entities/word_entity.dart
│   │   ├── repositories/dictionary_repository.dart
│   │   └── usecases/
│   │       ├── get_words_usecase.dart
│   │       ├── get_favorites_usecase.dart
│   │       ├── update_favorite_usecase.dart
│   │       └── search_words_usecase.dart
│   │
│   └── presentation/
│       ├── screens/
│       │   ├── splash/splash_screen.dart
│       │   ├── main/main_screen.dart
│       │   ├── home/home_screen.dart
│       │   ├── favorites/favorites_screen.dart
│       │   ├── settings/settings_screen.dart
│       │   └── word_detail/word_detail_screen.dart
│       │
│       ├── viewmodels/
│       │   ├── home_viewmodel.dart
│       │   ├── favorites_viewmodel.dart
│       │   └── settings_viewmodel.dart
│       │
│       └── widgets/
│           ├── word_card.dart
│           ├── search_bar_widget.dart
│           ├── animated_gradient_background.dart
│           └── empty_state.dart
│
├── assets/dictionary.db
├── pubspec.yaml
└── README.md
