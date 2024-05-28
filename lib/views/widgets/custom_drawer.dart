import 'package:flutter/material.dart';
import 'package:settings_page/views/screens/home_screen.dart';
import 'package:settings_page/views/screens/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<String> onScaffoldColorChanged;
  final ValueChanged<String> onAppBarColorChanged;
  const CustomDrawer({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onScaffoldColorChanged,
    required this.onAppBarColorChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Hotels"),
                Text("Menu"),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return HomeScreen(
                      onThemeChanged: onThemeChanged,
                      onBackgroundImageChanged: onBackgroundImageChanged,
                      onScaffoldColorChanged: onScaffoldColorChanged,
                      onAppBarColorChanged: onAppBarColorChanged,
                    );
                  },
                ),
              );
            },
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return SettingsScreen(
                      onThemeChanged: onThemeChanged,
                      onBackgroundImageChanged: onBackgroundImageChanged,
                      onScaffoldColorChanged: onScaffoldColorChanged,
                      onAppBarColorChanged: onAppBarColorChanged,
                    );
                  },
                ),
              );
            },
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            trailing: const Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }
}
