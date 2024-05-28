import 'package:flutter/material.dart';
import 'package:settings_page/utils/app_constants.dart';
import 'package:settings_page/views/widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<String> onScaffoldColorChanged;
  final ValueChanged<String> onAppBarColorChanged;

  const SettingsScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onScaffoldColorChanged,
    required this.onAppBarColorChanged,
  });
  @override
  State<SettingsScreen> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  final imageController = TextEditingController();
  String scaffoldDropdownColorValue = "amber";
  String appBarDropdownColorValue = "amber";
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
        title: const Text("Settings"),
      ),
      drawer: CustomDrawer(
        onThemeChanged: widget.onThemeChanged,
        onBackgroundImageChanged: widget.onBackgroundImageChanged,
        onScaffoldColorChanged: widget.onScaffoldColorChanged,
        onAppBarColorChanged: widget.onAppBarColorChanged,
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
              title: const Text("Dark Mode"),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    controller: imageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Paste image URL here",
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
                    child: const Text("Save Image"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const Text("Select color for Scaffold:"),
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
                            value: scaffoldDropdownColorValue,
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
                                scaffoldDropdownColorValue,
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
                      const Text("Select color for AppBar:"),
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
                                appBarDropdownColorValue,
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
