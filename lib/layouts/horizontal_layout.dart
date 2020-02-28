import 'package:flutter/material.dart';

import '../components/entries_list_view.dart';
import '../components/entry_contents_view.dart';
import '../models/entry.dart';
import '../models/memories.dart';

class HorizontalLayout extends StatefulWidget {

  final Memories memories;

  const HorizontalLayout({Key key, @required this.memories}) : super(key: key);

  @override
  _HorizontalLayoutState createState() => _HorizontalLayoutState();
}

class _HorizontalLayoutState extends State<HorizontalLayout> {

  Entry currentEntry;

  void updateEntryContentsView(BuildContext context, Entry entry) {
    setState( () {
      currentEntry = entry;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: EntriesListView(memories: widget.memories, onTap: updateEntryContentsView)),
        Expanded(child: EntryContentsView(entry: currentEntry))
      ]
    );
  }
}