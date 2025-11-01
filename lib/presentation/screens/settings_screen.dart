
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_theme.dart';
import '../viewmodels/settings_view_model.dart';
import '../widgets/animated_gradient_background.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsViewModel viewModel = Get.find();

    return Scaffold(
      body: Stack(
        children: [
          const AnimatedGradientBackground(),

          SafeArea(
            child: Column(
              children: [
                _buildHeader(context),

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(20),
                      children: [
                        // Theme Section
                        _buildSectionTitle(context, 'Appearance'),
                        const SizedBox(height: 12),
                        _buildThemeCard(context, viewModel),

                        const SizedBox(height: 32),

                        // Font Size Section
                        _buildSectionTitle(context, 'Font Sizes'),
                        const SizedBox(height: 12),
                        _buildFontSizeCard(
                          context,
                          viewModel,
                          'Title Font Size',
                          viewModel.titleFontSize,
                          viewModel.increaseTitleFont,
                          viewModel.decreaseTitleFont,
                        ),
                        const SizedBox(height: 12),
                        _buildFontSizeCard(
                          context,
                          viewModel,
                          'Body Font Size',
                          viewModel.bodyFontSize,
                          viewModel.increaseBodyFont,
                          viewModel.decreaseBodyFont,
                        ),

                        const SizedBox(height: 32),

                        // Reset Button
                        _buildResetButton(context, viewModel),

                        const SizedBox(height: 20),

                        // App Info
                        _buildAppInfo(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
                  Icons.settings,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Settings',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Customize your experience',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withValues(alpha:0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: AppTheme.primaryColor,
      ),
    );
  }

  Widget _buildThemeCard(BuildContext context, SettingsViewModel viewModel) {
    return Obx(() => Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: viewModel.toggleTheme,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    viewModel.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Theme Mode',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        viewModel.isDarkMode.value ? 'Dark mode' : 'Light mode',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppTheme.textSecondary.withValues(alpha:0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _buildFontSizeCard(
      BuildContext context,
      SettingsViewModel viewModel,
      String title,
      RxInt fontSize,
      VoidCallback onIncrease,
      VoidCallback onDecrease,
      ) {
    return Obx(() => Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${fontSize.value}px',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: onDecrease,
                icon: const Icon(Icons.remove_circle_outline),
                color: AppTheme.accentColor,
                iconSize: 32,
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: onIncrease,
                icon: const Icon(Icons.add_circle_outline),
                color: AppTheme.primaryColor,
                iconSize: 32,
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Widget _buildResetButton(BuildContext context, SettingsViewModel viewModel) {
    return ElevatedButton.icon(
      onPressed: viewModel.resetSettings,
      icon: const Icon(Icons.refresh),
      label: const Text('Reset to Default'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.accentColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
      ),
    );
  }

  Widget _buildAppInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withValues(alpha:0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            'E2B Dictionary',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Version 2.0.0',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Built with ❤️ using Flutter',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}