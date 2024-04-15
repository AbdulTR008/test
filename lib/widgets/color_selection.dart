import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../theme/app_theme.dart';
import '../provider/theme_provider.dart';

class ColorSelection extends ConsumerWidget {
  const ColorSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? themeTitle;
    var selectedTheme = ref.watch(selectedThemeProvider);

    if (selectedTheme.name == 'Orange') {
      themeTitle = AppLocalizations.of(context)!.orange;
    }
    if (selectedTheme.name == 'Green') {
      themeTitle = AppLocalizations.of(context)!.green;
    }
    if (selectedTheme.name == 'Blue') {
      themeTitle = AppLocalizations.of(context)!.blue;
    }
    if (selectedTheme.name == 'Purple') {
      themeTitle = AppLocalizations.of(context)!.purple;
    }

    void bottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<AppTheme>(
                  title: Text(AppLocalizations.of(context)!.orange),
                  value: AppTheme.Orange,
                  groupValue: selectedTheme,
                  onChanged: (value) {
                    ref
                        .read(selectedThemeProvider.notifier)
                        .selectTheme(value!);
                    selectedTheme = value;
                  },
                ),
                RadioListTile<AppTheme>(
                  title: Text(AppLocalizations.of(context)!.green),
                  value: AppTheme.Green,
                  groupValue: selectedTheme,
                  onChanged: (value) {
                    ref
                        .read(selectedThemeProvider.notifier)
                        .selectTheme(value!);
                    selectedTheme = value;
                  },
                ),
                RadioListTile<AppTheme>(
                  title: Text(AppLocalizations.of(context)!.purple),
                  value: AppTheme.Purple,
                  groupValue: selectedTheme,
                  onChanged: (value) {
                    ref
                        .read(selectedThemeProvider.notifier)
                        .selectTheme(value!);
                    selectedTheme = value;
                  },
                ),
                RadioListTile<AppTheme>(
                  title: Text(AppLocalizations.of(context)!.orange),
                  value: AppTheme.Blue,
                  groupValue: selectedTheme,
                  onChanged: (value) {
                    ref
                        .read(selectedThemeProvider.notifier)
                        .selectTheme(value!);
                    selectedTheme = value;
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return ListTile(
      title: Text(AppLocalizations.of(context)!.color_theme),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 13),
        child: Text(themeTitle.toString()),
      ),
      onTap: () {
        bottomSheet(context);
      },
    );
  }
}
