import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../provider/theme_provider.dart';

class SwitchDarkMode extends ConsumerStatefulWidget {
  const SwitchDarkMode({super.key});

  @override
  ConsumerState<SwitchDarkMode> createState() => _SwitchDarkModeState();
}

class _SwitchDarkModeState extends ConsumerState<SwitchDarkMode> {
  @override
  Widget build(BuildContext context) {
    final currentThemeMode = ref.watch(themeProvider);

    return ListTile(
      title: Text(AppLocalizations.of(context)!.dark_mode),
      trailing: Switch(
          value: currentThemeMode == ThemeMode.dark,
          onChanged: (value) {
            ref.read(themeProvider.notifier).state =
                value ? ThemeMode.dark : ThemeMode.light;
          }),
    );
  }
}
