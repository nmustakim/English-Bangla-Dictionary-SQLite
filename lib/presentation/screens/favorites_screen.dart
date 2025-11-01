import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../viewmodels/favorites_view_model.dart';
import '../widgets/animated_gradient_background.dart';
import '../widgets/empty_state.dart';
import '../widgets/search_bar.dart';
import '../widgets/word_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesViewModel viewModel = Get.find();

    return Scaffold(
      body: Stack(
        children: [
          const AnimatedGradientBackground(),

          SafeArea(
            child: Column(
              children: [
                _buildHeader(context, viewModel),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: SearchBarWidget(
                    hintText: 'Search favorites...',
                    onChanged: viewModel.searchFavorites,
                    onClear: viewModel.clearSearch,
                  ),
                ),

                // Favorites List
                Expanded(
                  child: Obx(() {
                    if (viewModel.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (viewModel.errorMessage.value.isNotEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 64,
                              color: AppTheme.accentColor,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              viewModel.errorMessage.value,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton.icon(
                              onPressed: viewModel.loadFavorites,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    }

                    if (viewModel.filteredFavorites.isEmpty) {
                      if (viewModel.searchQuery.value.isEmpty) {
                        return const EmptyState(
                          icon: Icons.favorite_border,
                          title: 'No Favorites Yet',
                          subtitle: 'Start adding words to your favorites\nby tapping the heart icon',
                        );
                      } else {
                        return const EmptyState(
                          icon: Icons.search_off,
                          title: 'No Results',
                          subtitle: 'Try a different search term',
                        );
                      }
                    }

                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 16,
                          right: 16,
                          bottom: 20,
                        ),
                        itemCount: viewModel.filteredFavorites.length,
                        itemBuilder: (context, index) {
                          final word = viewModel.filteredFavorites[index];
                          return WordCard(word: word, index: index);
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, FavoritesViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha:0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const Spacer(),
              Obx(() => Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha:0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${viewModel.favorites.length} Favorites',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'My Favorites',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your saved words collection',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withValues(alpha:0.9),
            ),
          ),
        ],
      ),
    );
  }
}

