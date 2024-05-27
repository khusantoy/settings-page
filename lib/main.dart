import 'package:flutter/material.dart';
import 'package:settings_page/utils/app_constants.dart';
import 'package:settings_page/views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void toggleThemeMode(bool value) {
    AppConstants.themeMode = value ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  void changeBackgroundImage(String imageUrl) {
    if (imageUrl.trim().isNotEmpty) {
      AppConstants.backgroundImageUrl = imageUrl;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: AppConstants.themeMode,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
        ),
      ),
      home: HomeScreen(
        onThemeChanged: toggleThemeMode,
      ),
    );
  }
}
