import 'package:flutter/material.dart';
import 'package:settings_page/views/screens/home_screen.dart';
import 'package:settings_page/views/screens/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  const CustomDrawer({super.key, required this.onThemeChanged});
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
