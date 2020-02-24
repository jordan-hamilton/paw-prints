import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/entry_list.dart';
import 'screens/create_entry.dart';

class App extends StatelessWidget {

  final String title;

  static final routes = {
    EntryList.routeName: (context) => EntryList(),
    CreateEntry.routeName: (context) => CreateEntry()
  };

  const App({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent
      ),
      routes: routes,
    );
  }
}

void printKeys() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(prefs.getKeys());

}