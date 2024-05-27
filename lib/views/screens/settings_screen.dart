import 'package:flutter/material.dart';
import 'package:settings_page/utils/app_constants.dart';
import 'package:settings_page/views/widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  const SettingsScreen({super.key, required this.onThemeChanged});
  @override
  State<SettingsScreen> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  final imageController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      drawer: CustomDrawer(
        onThemeChanged: widget.onThemeChanged,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
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
                  const TextField(
                    decoration: InputDecoration(
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
