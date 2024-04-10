import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../provider/font_provider.dart';

class ChangeFontStyle extends ConsumerStatefulWidget {
  const ChangeFontStyle({super.key});

  @override
  ConsumerState<ChangeFontStyle> createState() => _ChangeFontStyleState();
}

class _ChangeFontStyleState extends ConsumerState<ChangeFontStyle> {
  bool _isExpanded = false;
  List<String> fontNames = [
    'Josefin Sans',
    'Plus Jakarta Sans',
    'Ubuntu',
    'Arvo'
  ];
  String exampleWord = 'Hey, Hello';

  void selectFont(String fontName) {
    ref.read(fontProvider.notifier).state = fontName;
  }

  @override
  Widget build(BuildContext context) {
    final selectedFont = ref.watch(fontProvider);
    return Column(
      children: [
        ListTile(
          title: Text(
            AppLocalizations.of(context)!.change_font_style,
            style: const TextStyle(fontSize: 16.0),
          ),
          trailing: IconButton(
              icon: _isExpanded
                  ? const Icon(Icons.arrow_drop_up_sharp)
                  : const Icon(Icons.arrow_drop_down_sharp),
              iconSize: 30.0,
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              }),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceInOut,
          height: _isExpanded ? null : 0.00,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: fontNames.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  fontNames[index],
                  style: GoogleFonts.getFont(fontNames[index]),
                ),
                trailing: Text(
                  exampleWord,
                  style: GoogleFonts.getFont(fontNames[index]),
                ),
                onTap: () {
                  selectFont(fontNames[index]);
                },
                selected: fontNames[index] == selectedFont,
              );
            },
          ),
        )
      ],
    );
  }
}

class FontStyleManager {
  static String selectedFont = 'Josefin Sans'; // Initial font

  static void updateFont(String newFont) {
    selectedFont = newFont;
  }
}
