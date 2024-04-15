import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../provider/theme_provider.dart';

class ThemeSelection extends ConsumerStatefulWidget {
  const ThemeSelection({super.key});
  @override
  ConsumerState<ThemeSelection> createState() => _ThemeSelectionState();
}

class _ThemeSelectionState extends ConsumerState<ThemeSelection> {
  String? title;


  @override
  Widget build(BuildContext context) {
    
    return ListTile(
      title: Text(AppLocalizations.of(context)!.select_theme_mode),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 13),
        child: Text(ref.watch(themeProvider).name == 'dark'
            ? AppLocalizations.of(context)!.dark
            : AppLocalizations.of(context)!.light),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Consumer(
              builder: (context, ref, _) {
                final theme = ref.watch(themeProvider);
                return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  title: Text(AppLocalizations.of(context)!.select_theme_mode),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile(
                        title: Text(AppLocalizations.of(context)!.light),
                        value: ThemeMode.light,
                        groupValue: theme,
                        onChanged: (value) {
               
                          ref
                              .read(themeProvider.notifier)
                              .update((state) => value!);
                        },
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      RadioListTile(
                        title: Text(AppLocalizations.of(context)!.dark),
                        value: ThemeMode.dark,
                        groupValue: theme,
                        onChanged: (value) {
                        
                          ref
                              .read(themeProvider.notifier)
                              .update((state) => value!);
                        },
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      RadioListTile(
                        title:
                            Text(AppLocalizations.of(context)!.systemDefault),
                        value: ThemeMode.system,
                        groupValue: theme,
                        onChanged: (value) {
                          ref
                              .read(themeProvider.notifier)
                              .update((state) => value!);
                        },
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(AppLocalizations.of(context)!.ok),
                    )
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
