import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../theme/app_theme.dart';
import '../provider/theme_provider.dart';

class ColorSelection extends ConsumerWidget {
  const ColorSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppTheme _selectedTheme = ref.watch(selectedThemeProvider);

    void _bottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<AppTheme>(
                  title: Text('Orange'),
                  value: AppTheme.Orange,
                  groupValue: _selectedTheme,
                  onChanged: (value) {
                    ref
                        .read(selectedThemeProvider.notifier)
                        .selectTheme(value!);
                    _selectedTheme = value;
                  },
                ),
                RadioListTile<AppTheme>(
                  title: Text('Green'),
                  value: AppTheme.Green,
                  groupValue: _selectedTheme,
                  onChanged: (value) {
                    ref
                        .read(selectedThemeProvider.notifier)
                        .selectTheme(value!);
                    _selectedTheme = value;
                  },
                ),
                RadioListTile<AppTheme>(
                  title: Text('Purple'),
                  value: AppTheme.Purple,
                  groupValue: _selectedTheme,
                  onChanged: (value) {
                    ref
                        .read(selectedThemeProvider.notifier)
                        .selectTheme(value!);
                    _selectedTheme = value;
                  },
                ),
                RadioListTile<AppTheme>(
                  title: Text('Blue'),
                  value: AppTheme.Blue,
                  groupValue: _selectedTheme,
                  onChanged: (value) {
                    ref
                        .read(selectedThemeProvider.notifier)
                        .selectTheme(value!);
                    _selectedTheme = value;
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
        child: Text(_selectedTheme.toString().split('.').last),
      ),
      onTap: () {
        _bottomSheet(context);
      },
    );
  }
}
