import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/entry_list.dart';
import 'screens/create_entry.dart';

class App extends StatefulWidget {

  final String title;
  final SharedPreferences prefs;

  const App({Key key, @required this.title, @required this.prefs}) : super(key: key);

  @override
  _AppState createState() => _AppState(title: title);
}

class _AppState extends State<App> {

  final String title;

  _AppState({this.title});

  static const DARK_MODE_KEY = 'darkMode';
  bool get darkMode => widget.prefs.getBool(DARK_MODE_KEY) ?? false;

  Brightness appBrightness;

  void toggleTheme() {
    setState( () {
      widget.prefs.setBool(DARK_MODE_KEY, !darkMode);
      appBrightness = darkMode ? Brightness.dark : Brightness.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.prefs.getBool(DARK_MODE_KEY));
    return MaterialApp(
      title: widget.title,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        brightness: appBrightness
      ),
      routes: {
        EntryList.routeName: (context) => EntryList(themeSwitcher: toggleTheme, title: title),
        CreateEntry.routeName: (context) => CreateEntry()
      },
    );
  }

}
