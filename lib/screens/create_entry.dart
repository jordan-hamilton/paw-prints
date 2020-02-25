import 'package:flutter/material.dart';

import '../components/entry_form.dart';
import '../components/settings_drawer.dart';

class CreateEntry extends StatelessWidget {

  static const routeName = 'createEntry';
  final void Function() themeSwitcher;

  const CreateEntry({Key key, this.themeSwitcher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Memory'
        )
      ),
      endDrawer: SettingsDrawer(themeSwitcher: themeSwitcher),
      body: EntryForm()
    );
  }
}

void backToEntryList(BuildContext context) {
  Navigator.of(context).pop();
}