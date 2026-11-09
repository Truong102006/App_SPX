import 'core/localization/app_language.dart';
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/showcase/presentation/screens/screen_showcase_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SpxExpressApp());
}

class SpxExpressApp extends StatefulWidget {
  const SpxExpressApp({super.key});

  @override
  State<SpxExpressApp> createState() => _SpxExpressAppState();
}

class _SpxExpressAppState extends State<SpxExpressApp> {
  AppLanguage _language = AppLanguage.english;

  @override
  Widget build(BuildContext context) {
    return AppLanguageScope(
      language: _language,
      onChanged: (language) => setState(() => _language = language),
      child: MaterialApp(
        title: 'SPX Express - Delayed Parcel Support',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const ScreenShowcasePage(),
      ),
    );
  }
}
