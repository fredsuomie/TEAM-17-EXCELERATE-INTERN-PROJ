import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const LearnSphereApp());
}

class LearnSphereApp extends StatelessWidget {
  const LearnSphereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LearnSphere',
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF1877F2),
      scaffoldBackgroundColor: const Color(0xFFF0F2F5),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFF050505)),
        bodyMedium: TextStyle(color: Color(0xFF65676B)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF050505)),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF1877F2)),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF2E89FF),
      scaffoldBackgroundColor: const Color(0xFF18191A),
      cardColor: const Color(0xFF242526),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFE4E6EB)),
        bodyMedium: TextStyle(color: Color(0xFFB0B3B8)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF242526),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFFE4E6EB)),
      ),
      colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark)
          .copyWith(secondary: const Color(0xFF2E89FF)),
    );
  }
}
