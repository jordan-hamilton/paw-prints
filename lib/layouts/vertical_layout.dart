import 'package:flutter/material.dart';

import '../components/entries_list_view.dart';
import '../models/entry.dart';
import '../models/memories.dart';
import '../screens/entry_contents.dart';

class VerticalLayout extends StatelessWidget {

  final Memories memories;

  const VerticalLayout({Key key, @required this.memories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntriesListView(
      memories: memories,
      onTap: pushEntryContentsScreen
    );
  }
}

void pushEntryContentsScreen(BuildContext context, Entry entry) {
  Navigator.of(context).pushNamed(EntryContents.routeName, arguments: entry);
}
