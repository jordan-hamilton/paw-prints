import 'package:flutter/material.dart';

import '../app.dart';

class SettingsDrawer extends StatelessWidget {

  void _toggleTheme(AppState appState) => appState.toggleTheme();

  bool _getDarkModeStatus(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? true : false;

  const SettingsDrawer({Key key}) : super(key: key);

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
            value: _getDarkModeStatus(context),
            onChanged: (value) => _toggleTheme(appState),
          ),
        ],
      )
    );
  }  
}