import 'package:flutter/material.dart';
import 'package:settings_page/utils/app_constants.dart';
import 'package:settings_page/views/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> saveString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("themeMode", AppConstants.themeMode);
    await prefs.setString(
        "backgroundImageUrl", AppConstants.backgroundImageUrl);
    await prefs.setString("scaffoldColor", AppConstants.scaffoldColor ?? '');
    await prefs.setString("appBarColor", AppConstants.appBarColor);
    await prefs.setString("language", AppConstants.language);
    await prefs.setDouble("fontScaling", AppConstants.fontScaling);
  }

  Future<void> getString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      AppConstants.themeMode = prefs.getString("themeMode")!;
      AppConstants.backgroundImageUrl = prefs.getString("backgroundImageUrl")!;
      AppConstants.scaffoldColor = prefs.getString("scaffoldColor")!;
      AppConstants.appBarColor = prefs.getString("appBarColor")!;
      AppConstants.language = prefs.getString("language")!;
      AppConstants.fontScaling = prefs.getDouble("fontScaling")!;
    });
  }

  @override
  void initState() {
    getString();
    super.initState();
  }

  void toggleThemeMode(bool value) {
    AppConstants.themeMode = value ? 'dark' : 'light';
    saveString();
    setState(() {});
  }

  void changeBackgroundImage(String imageUrl) {
    if (imageUrl.trim().isNotEmpty) {
      AppConstants.backgroundImageUrl = imageUrl;
      saveString();
      setState(() {});
    }
  }

  void changeScaffoldColor(String color) {
    if (color == 'amber') {
      AppConstants.scaffoldColor = 'amber';
    } else if (color == 'green') {
      AppConstants.scaffoldColor = 'green';
    } else if (color == 'blue') {
      AppConstants.scaffoldColor = 'blue';
    } else if (color == 'red') {
      AppConstants.scaffoldColor = 'red';
    }
    saveString();
    setState(() {});
  }

  void changeAppBarColor(String color) {
    if (color == 'amber') {
      AppConstants.appBarColor = 'amber';
    } else if (color == 'green') {
      AppConstants.appBarColor = 'green';
    } else if (color == 'blue') {
      AppConstants.appBarColor = 'blue';
    } else if (color == 'red') {
      AppConstants.appBarColor = 'red';
    }
    saveString();
    setState(() {});
  }

  void changeLanguage(String lang) {
    if (lang == 'uz') {
      AppConstants.language = 'UZ';
    } else if (lang == 'en') {
      AppConstants.language = 'EN';
    } else if (lang == 'ru') {
      AppConstants.language = 'RU';
    }
    saveString();
    setState(() {});
  }

  void changeFontScaling(String size) {
    if (size == '1') {
      AppConstants.fontScaling = 1.1;
    } else if (size == '2') {
      AppConstants.fontScaling = 1.2;
    } else if (size == '3') {
      AppConstants.fontScaling = 1.3;
    }
    saveString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode:
          AppConstants.themeMode == 'light' ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppConstants.appBarColor == 'amber'
              ? Colors.amber
              : AppConstants.appBarColor == 'green'
                  ? Colors.green
                  : AppConstants.appBarColor == 'blue'
                      ? Colors.blue
                      : Colors.red,
        ),
      ),
      home: HomeScreen(
        onThemeChanged: toggleThemeMode,
        onBackgroundImageChanged: changeBackgroundImage,
        onScaffoldColorChanged: changeScaffoldColor,
        onAppBarColorChanged: changeAppBarColor,
        onLanguageChanged: changeLanguage,
        onFontSizeChanged: changeFontScaling,
      ),
    );
  }
}
