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

  void changeScaffoldColor(String color) {
    if (color == 'amber') {
      AppConstants.scaffoldColor = Colors.amber;
    } else if (color == 'green') {
      AppConstants.scaffoldColor = Colors.green;
    } else if (color == 'blue') {
      AppConstants.scaffoldColor = Colors.blue;
    } else if (color == 'red') {
      AppConstants.scaffoldColor = Colors.red;
    }
    setState(() {});
  }

  void changeAppBarColor(String color) {
    if (color == 'amber') {
      AppConstants.appBarColor = Colors.amber;
    } else if (color == 'green') {
      AppConstants.appBarColor = Colors.green;
    } else if (color == 'blue') {
      AppConstants.appBarColor = Colors.blue;
    } else if (color == 'red') {
      AppConstants.appBarColor = Colors.red;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: AppConstants.themeMode,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppConstants.appBarColor,
        ),
      ),
      home: HomeScreen(
        onThemeChanged: toggleThemeMode,
        onBackgroundImageChanged: changeBackgroundImage,
        onScaffoldColorChanged: changeScaffoldColor,
        onAppBarColorChanged: changeAppBarColor,
      ),
    );
  }
}
