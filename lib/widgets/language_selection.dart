import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/language.dart';
import '../provider/language_provider.dart';

class LanguageSelection extends ConsumerStatefulWidget {
  const LanguageSelection({super.key});

  @override
  ConsumerState<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends ConsumerState<LanguageSelection> {
  final List<Language> _language = Language.languages();

  int? selectedLanguageIndex = 1;

  String? languageRec;

  void language(int index, String pickLang) {
    languageRec = pickLang;
    selectedLanguageIndex = index;
    ref
        .read(selectedLanguageProvider.notifier)
        .pickedLanguage(languageRec ?? 'en');
    setState(() {});
  }

 
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.languages),
      trailing: DropdownButton<int>(
        value: selectedLanguageIndex,
        items: _language.asMap().entries.map((entry) {
          int index = entry.key;
          Language language = entry.value;
          return DropdownMenuItem<int>(
            value: index,
            child: Text(
              language.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
        onChanged: (int? index) {
          if (index != null) {
            language(index, _language[index].languageCode);
          }
        },
      ),
    );
  }
}
