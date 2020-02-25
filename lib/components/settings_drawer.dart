import 'package:flutter/material.dart';

import '../app.dart';

class SettingsDrawer extends StatefulWidget {

  const SettingsDrawer({Key key}) : super(key: key);

  @override
  _SettingsDrawerState createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {

  bool _getDarkModeStatus() => Theme.of(context).brightness == Brightness.dark ? true : false;

  void _toggleTheme(AppState appState) => appState.toggleTheme();

  @override
  Widget build(BuildContext context) {

    AppState appState = context.findAncestorStateOfType<AppState>();

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            child: Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          SwitchListTile(
            secondary: Icon(Icons.settings_brightness),
            title: Text('Dark Mode'),
            value: _getDarkModeStatus(),
            onChanged: (value) => _toggleTheme(appState),
          ),
        ],
      )
    );
  }  
}