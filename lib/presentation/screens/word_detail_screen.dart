import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/word_entity.dart';
import '../../domain/usecases/update_favorite_usecase.dart';
import '../../../core/theme/app_theme.dart';
import '../viewmodels/favorites_view_model.dart';
import '../viewmodels/home_view_model.dart';

class WordDetailScreen extends StatefulWidget {
  const WordDetailScreen({super.key});

  @override
  State<WordDetailScreen> createState() => _WordDetailScreenState();
}

class _WordDetailScreenState extends State<WordDetailScreen> with SingleTickerProviderStateMixin {
  late WordEntity word;
  late bool isFavorite;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    word = Get.arguments as WordEntity;
    isFavorite = word.isFavorite;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _toggleFavorite() async {
    try {
      final updateUseCase = Get.find<UpdateFavoriteUseCase>();
      final updatedWord = word.copyWith(isFavorite: !isFavorite);

      await updateUseCase(updatedWord);

      setState(() {
        isFavorite = !isFavorite;
        word = updatedWord;
      });

      try {
        final homeViewModel = Get.find<HomeViewModel>();
        await homeViewModel.loadWords();
      } catch (_) {}

      try {
        final favViewModel = Get.find<FavoritesViewModel>();
        await favViewModel.loadFavorites();
      } catch (_) {}

      Get.snackbar(
        isFavorite ? 'Added to Favorites' : 'Removed from Favorites',
        word.word,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        backgroundColor: isFavorite ? AppTheme.secondaryColor : AppTheme.accentColor,
        colorText: Colors.white,
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.white,
        ),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update favorite status',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.accentColor,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: AppTheme.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                word.word,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(0, 1),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                ),
                child: const Center(
                  child: Icon(
                    Icons.book_rounded,
                    size: 80,
                    color: Colors.white24,
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: _toggleFavorite,
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      key: ValueKey(isFavorite),
                      color: isFavorite ? AppTheme.accentColor : Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Content
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Meaning Section
                      _buildSection(
                        context,
                        icon: Icons.lightbulb_outline,
                        title: 'Meaning',
                        content: word.meaning,
                        gradient: AppTheme.primaryGradient,
                      ),

                      const SizedBox(height: 20),

                      // Parts of Speech
                      _buildSection(
                        context,
                        icon: Icons.category_outlined,
                        title: 'Parts of Speech',
                        content: word.partsOfSpeech.toUpperCase(),
                        gradient: const LinearGradient(
                          colors: [AppTheme.secondaryColor, Color(0xFF66BB6A)],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Example Section
                      _buildSection(
                        context,
                        icon: Icons.format_quote,
                        title: 'Example',
                        content: word.example,
                        gradient: AppTheme.accentGradient,
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String content,
        required Gradient gradient,
      }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).cardColor,
            Theme.of(context).cardColor,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 24),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}