import 'package:flutter/material.dart';

import '../widgets/switch_darkmode.dart';
import '../widgets/color_selection.dart';
import '../widgets/font_selection.dart';
import '../widgets/theme_selection.dart';
import '../widgets/language_selection.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Settings'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LanguageSelection(),
            ChangeFontStyle(),
            ColorSelection(),
            ThemeSelection(),
            SwitchDarkMode(),
          ],
        ),
      ),
    );
  }
}
