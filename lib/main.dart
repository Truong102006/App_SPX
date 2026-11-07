import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/showcase/presentation/screens/screen_showcase_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SpxExpressApp());
}

class SpxExpressApp extends StatelessWidget {
  const SpxExpressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPX Express - Delayed Parcel Support',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const ScreenShowcasePage(),
    );
  }
}

