import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/onboarding_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.white70,
          surface: Color(0xFF1A237E),
          onSurface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A237E),
          elevation: 0,
        ),
        scaffoldBackgroundColor: const Color(0xFF0D1344),
        cardTheme: CardTheme(
          color: const Color(0xFF1A237E),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF1A237E),
        ),
      ),
      home: const OnboardingScreen(),
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
    );
  }
}
