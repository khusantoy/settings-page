import 'package:flutter/material.dart';
import 'package:settings_page/utils/app_constants.dart';
import 'package:settings_page/views/widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<String> onScaffoldColorChanged;
  final ValueChanged<String> onAppBarColorChanged;
  final ValueChanged<String> onLanguageChanged;
  final ValueChanged<String> onFontSizeChanged;

  const SettingsScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onScaffoldColorChanged,
    required this.onAppBarColorChanged,
    required this.onLanguageChanged,
    required this.onFontSizeChanged,
  });
  @override
  State<SettingsScreen> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  final imageController = TextEditingController();
  String? scaffoldDropdownColorValue;
  String? appBarDropdownColorValue;
  String appLang = 'en';
  String fontScaling = '1';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.scaffoldColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Settings",
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
        child: ListView(
          children: [
            SwitchListTile(
              value: AppConstants.themeMode == ThemeMode.dark,
              onChanged: widget.onThemeChanged,
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  fontSize: 14 * AppConstants.fontScaling,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    controller: imageController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Paste image URL here",
                      hintStyle: TextStyle(
                        fontSize: 14 * AppConstants.fontScaling,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String imageUrl = imageController.text;
                      imageController.clear();
                      widget.onBackgroundImageChanged(imageUrl);
                    },
                    child: Text(
                      "Save Image",
                      style: TextStyle(
                        fontSize: 14 * AppConstants.fontScaling,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Select color for Scaffold:",
                        style: TextStyle(
                          fontSize: 14 * AppConstants.fontScaling,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          color: AppConstants.themeMode == ThemeMode.dark
                              ? Colors.black
                              : Colors.white,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0, style: BorderStyle.solid),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Text(
                              "Colors",
                              style: TextStyle(
                                fontSize: 14 * AppConstants.fontScaling,
                              ),
                            ),
                            value: scaffoldDropdownColorValue,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            items: const [
                              DropdownMenuItem(
                                value: "amber",
                                child: Text(
                                  "Amber",
                                  style: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "green",
                                child: Text(
                                  "Green",
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "blue",
                                child: Text(
                                  "Blue",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "red",
                                child: Text(
                                  "Red",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                            onChanged: (newValue) {
                              scaffoldDropdownColorValue = newValue!;
                              widget.onScaffoldColorChanged(
                                scaffoldDropdownColorValue!,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Select color for AppBar:",
                        style: TextStyle(
                          fontSize: 14 * AppConstants.fontScaling,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          color: AppConstants.themeMode == ThemeMode.dark
                              ? Colors.black
                              : Colors.white,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0, style: BorderStyle.solid),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: const Text("Colors"),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            value: appBarDropdownColorValue,
                            items: const [
                              DropdownMenuItem(
                                value: "amber",
                                child: Text(
                                  "Amber",
                                  style: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "green",
                                child: Text(
                                  "Green",
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "blue",
                                child: Text(
                                  "Blue",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "red",
                                child: Text(
                                  "Red",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                            onChanged: (newValue) {
                              appBarDropdownColorValue = newValue!;
                              widget.onAppBarColorChanged(
                                appBarDropdownColorValue!,
                              );
                              setState(() {});
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Select App Language:",
                        style: TextStyle(
                          fontSize: 14 * AppConstants.fontScaling,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          color: AppConstants.themeMode == ThemeMode.dark
                              ? Colors.black
                              : Colors.white,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0, style: BorderStyle.solid),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            value: appLang,
                            items: const [
                              DropdownMenuItem(
                                value: "uz",
                                child: Text("UZ"),
                              ),
                              DropdownMenuItem(
                                value: "en",
                                child: Text("EN"),
                              ),
                              DropdownMenuItem(
                                value: "ru",
                                child: Text("RU"),
                              ),
                            ],
                            onChanged: (newValue) {
                              appLang = newValue!;
                              widget.onLanguageChanged(
                                appLang,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Select font scaling:",
                        style: TextStyle(
                          fontSize: 14 * AppConstants.fontScaling,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          color: AppConstants.themeMode == ThemeMode.dark
                              ? Colors.black
                              : Colors.white,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            value: fontScaling,
                            items: const [
                              DropdownMenuItem(
                                value: "1",
                                child: Text("1"),
                              ),
                              DropdownMenuItem(
                                value: "2",
                                child: Text("2"),
                              ),
                              DropdownMenuItem(
                                value: "3",
                                child: Text("3"),
                              ),
                            ],
                            onChanged: (newValue) {
                              fontScaling = newValue!;
                              widget.onFontSizeChanged(
                                fontScaling,
                              );
                              setState(() {});
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
