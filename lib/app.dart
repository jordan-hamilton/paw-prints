import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/create_entry.dart';
import 'screens/entry_contents.dart';
import 'screens/entries_list.dart';

class App extends StatefulWidget {
  final String title;
  final SharedPreferences prefs;

  const App({Key? key, required this.title, required this.prefs})
      : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final routes = {
    EntriesList.routeName: (context) => const EntriesList(),
    CreateEntry.routeName: (context) => const CreateEntry(),
    EntryContents.routeName: (context) => const EntryContents()
  };

  static const darkModeKey = 'darkMode';
  bool get darkMode => widget.prefs.getBool(darkModeKey) ?? false;

  late Brightness appBrightness;

  @override
  void initState() {
    super.initState();
    appBrightness = darkMode ? Brightness.dark : Brightness.light;
  }

  void toggleTheme() {
    setState(() {
      widget.prefs.setBool(darkModeKey, !darkMode);
      appBrightness = darkMode ? Brightness.dark : Brightness.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: widget.title,
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            colorScheme:
                const ColorScheme.light().copyWith(brightness: appBrightness)),
        routes: routes);
  }
}
