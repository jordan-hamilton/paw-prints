import 'package:flutter/material.dart';

import 'create_entry.dart';
import '../components/settings_drawer.dart';
import '../components/welcome.dart';
import '../db/database_manager.dart';
import '../layouts/horizontal_layout.dart';
import '../layouts/vertical_layout.dart';
import '../models/entry.dart';
import '../models/memories.dart';

class EntriesList extends StatefulWidget {

  static const routeName = '/';

  const EntriesList({Key key}) : super(key: key); 

  @override
  _EntriesListState createState() => _EntriesListState();
}

class _EntriesListState extends State<EntriesList> {

  Memories memories;

  @override
  void initState() {
    super.initState();
    loadEntries();
  }
  
  void loadEntries() async {
    final databaseManager = DatabaseManager.getInstance();
    List<Entry> entries = await databaseManager.getEntries();
    setState( () {
      memories = Memories(entries: entries);
    });
  }

  @override
  Widget build(BuildContext context) {
    loadEntries();
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

  Widget layoutPicker(BuildContext context, BoxConstraints constraints) {
    if (memories == null) {
      return CircularProgressIndicator();
    } else if (memories.entryCount == 0) {
      return Welcome();
    }
    return constraints.maxWidth < 800 ? VerticalLayout(memories: memories) : HorizontalLayout(memories: memories);
  }
}

void pushCreateEntry(BuildContext context) => Navigator.of(context).pushNamed(CreateEntry.routeName);
