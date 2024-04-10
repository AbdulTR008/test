import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

import '../provider/language_provider.dart';
import '../provider/font_provider.dart';
import '../provider/theme_provider.dart';
import '../screens/home.dart';
import '../theme/app_theme.dart';










import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'screens/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final selectedFont = ref.watch(fontProvider);
    final selectedTheme = ref.watch(selectedThemeProvider);
  
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(ref.watch(selectedLanguageProvider), ''),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: getAppTheme(selectedTheme, themeMode),
        fontFamily: GoogleFonts.getFont(selectedFont).fontFamily,
      ),
      darkTheme: ThemeData(
        colorScheme: getAppTheme(selectedTheme, ThemeMode.dark),
        fontFamily: GoogleFonts.getFont(selectedFont).fontFamily,
      ),
      themeMode: themeMode,
      home: const SettingScreen(),
    );
  }
}
