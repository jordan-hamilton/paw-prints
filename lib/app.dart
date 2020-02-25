import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/create_entry.dart';
import 'screens/entry_list.dart';

class App extends StatefulWidget {

  final String title;
  final SharedPreferences prefs;

  const App({Key key, @required this.title, @required this.prefs}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {

  final routes = {
    EntryList.routeName: (context) => EntryList(),
    CreateEntry.routeName: (context) => CreateEntry()
  };

  static const DARK_MODE_KEY = 'darkMode';
  bool get darkMode => widget.prefs.getBool(DARK_MODE_KEY) ?? false;

  Brightness appBrightness;

  void initState() {
    super.initState();
    appBrightness = darkMode ? Brightness.dark : Brightness.light;
  }

  void toggleTheme() {
    setState( () {
      widget.prefs.setBool(DARK_MODE_KEY, !darkMode);
      appBrightness = darkMode ? Brightness.dark : Brightness.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        brightness: appBrightness
      ),
      routes: routes
    );
  }

}
