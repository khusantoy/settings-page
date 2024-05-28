import 'package:flutter/material.dart';
import 'package:settings_page/utils/app_constants.dart';
import 'package:settings_page/views/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<String> onScaffoldColorChanged;
  final ValueChanged<String> onAppBarColorChanged;
  final ValueChanged<String> onLanguageChanged;
  final ValueChanged<String> onFontSizeChanged;
  const HomeScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onScaffoldColorChanged,
    required this.onAppBarColorChanged,
    required this.onLanguageChanged,
    required this.onFontSizeChanged,
  });
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.scaffoldColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 20 * AppConstants.fontScaling,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.5),
              ),
              child: Text(AppConstants.language),
            ),
          )
        ],
      ),
      drawer: CustomDrawer(
        onThemeChanged: widget.onThemeChanged,
        onBackgroundImageChanged: widget.onBackgroundImageChanged,
        onScaffoldColorChanged: widget.onScaffoldColorChanged,
        onAppBarColorChanged: widget.onAppBarColorChanged,
        onLanguageChanged: widget.onLanguageChanged,
        onFontSizeChanged: widget.onFontSizeChanged,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: AppConstants.backgroundImageUrl.isEmpty
              ? null
              : DecorationImage(
                  image: NetworkImage(
                    AppConstants.backgroundImageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
