import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsViewModel extends GetxController {
  final RxInt titleFontSize = 24.obs;
  final RxInt bodyFontSize = 16.obs;
  final RxBool isDarkMode = false.obs;

  static const String _titleFontKey = 'title_font_size';
  static const String _bodyFontKey = 'body_font_size';
  static const String _darkModeKey = 'dark_mode';

  @override
  void onInit() {
    super.onInit();
    loadSettings();
    isDarkMode.value = Get.isDarkMode;
  }

  Future<void> loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      titleFontSize.value = prefs.getInt(_titleFontKey) ?? 24;
      bodyFontSize.value = prefs.getInt(_bodyFontKey) ?? 16;
      isDarkMode.value = prefs.getBool(_darkModeKey) ?? Get.isDarkMode;
    } catch (e) {
      debugPrint('Error loading settings: $e');
    }
  }

  Future<void> increaseTitleFont() async {
    if (titleFontSize.value < 36) {
      titleFontSize.value++;
      await _saveSettings();
    }
  }

  Future<void> decreaseTitleFont() async {
    if (titleFontSize.value > 18) {
      titleFontSize.value--;
      await _saveSettings();
    }
  }

  Future<void> increaseBodyFont() async {
    if (bodyFontSize.value < 20) {
      bodyFontSize.value++;
      await _saveSettings();
    }
  }

  Future<void> decreaseBodyFont() async {
    if (bodyFontSize.value > 12) {
      bodyFontSize.value--;
      await _saveSettings();
    }
  }

  Future<void> toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    await _saveSettings();
  }

  Future<void> _saveSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_titleFontKey, titleFontSize.value);
      await prefs.setInt(_bodyFontKey, bodyFontSize.value);
      await prefs.setBool(_darkModeKey, isDarkMode.value);
    } catch (e) {
      debugPrint('Error saving settings: $e');
    }
  }

  Future<void> resetSettings() async {
    titleFontSize.value = 24;
    bodyFontSize.value = 16;
    await _saveSettings();
  }
}