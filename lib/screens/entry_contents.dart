import 'package:flutter/material.dart';

import '../components/entry_contents_view.dart';
import '../components/settings_drawer.dart';
import '../models/entry.dart';

class EntryContents extends StatelessWidget {

  static const routeName = 'entryContents';

  const EntryContents({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Entry entry;
    
    if (ModalRoute.of(context).settings.arguments is Entry) {
      entry = ModalRoute.of(context).settings.arguments;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          entry.title
        )
      ),
      endDrawer: SettingsDrawer(),
      body: EntryContentsView(entry: entry)
    );
  }
}