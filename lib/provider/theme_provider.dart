import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_theme.dart';

final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.dark);

final selectedThemeProvider = StateNotifierProvider<SelectedThemeNotifier, AppTheme>((ref) {
  return SelectedThemeNotifier();
});

class SelectedThemeNotifier extends StateNotifier<AppTheme> {
  SelectedThemeNotifier() : super(AppTheme.Orange);

  void selectTheme(AppTheme theme) {
    state = theme;
  }
}