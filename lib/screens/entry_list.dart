import 'package:flutter/material.dart';

import 'create_entry.dart';
import '../components/settings_drawer.dart';
import '../db/database_manager.dart';
import '../layouts/horizontal_layout.dart';
import '../layouts/vertical_layout.dart';
import '../models/entry.dart';

class EntryList extends StatefulWidget {

  static const routeName = '/';

  const EntryList({Key key}) : super(key: key); 

  @override
  _EntryListState createState() => _EntryListState();
}

class _EntryListState extends State<EntryList> {
  
  void loadEntries() async {
    final databaseManager = DatabaseManager.getInstance();
    List<Entry> entries = await databaseManager.getEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paw Prints'),
      ),
      body: LayoutBuilder(builder: layoutPicker),
      endDrawer: SettingsDrawer(),
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