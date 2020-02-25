import 'package:flutter/material.dart';

class SettingsDrawer extends StatefulWidget {

  final void Function() themeSwitcher;

  const SettingsDrawer({Key key, this.themeSwitcher}) : super(key: key);

  @override
  _SettingsDrawerState createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {

  bool getDarkModeStatus() {
    return Theme.of(context).brightness == Brightness.dark ? true : false;
  }

  @override
  Widget build(BuildContext context) {
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
            value: getDarkModeStatus(),
            onChanged: changeTheme,
          ),
        ],
      )
    );
  }

  void changeTheme(bool value) {
    widget.themeSwitcher();
  }

  
}