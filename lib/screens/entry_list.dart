import 'package:flutter/material.dart';

import './create_entry.dart';
import '../components/settings_drawer.dart';
import '../layouts/horizontal_layout.dart';
import '../layouts/vertical_layout.dart';

class EntryList extends StatelessWidget {

  static const routeName = '/';
  final String title;
  final void Function() themeSwitcher;

  EntryList({Key key, this.themeSwitcher, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: LayoutBuilder(builder: layoutPicker),
      endDrawer: SettingsDrawer(themeSwitcher: themeSwitcher),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pushCreateEntry(context),
        child: Icon(Icons.note_add) 
      ),
    );
  }
}

Widget layoutPicker(BuildContext context, BoxConstraints constraints) =>
  constraints.maxWidth < 800 ? VerticalLayout() : HorizontalLayout();

void pushCreateEntry(BuildContext context) => Navigator.of(context).pushNamed(CreateEntry.routeName);