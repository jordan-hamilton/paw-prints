import 'package:flutter/material.dart';

import '../components/entry_form.dart';
import '../components/settings_drawer.dart';

class CreateEntry extends StatelessWidget {

  static const routeName = 'createEntry';

  const CreateEntry({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Memory'
        )
      ),
      endDrawer: SettingsDrawer(),
      body: EntryForm()
    );
  }
}
