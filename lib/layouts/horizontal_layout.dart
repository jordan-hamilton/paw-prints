import 'package:flutter/material.dart';

import '../components/entries_list_view.dart';
import '../components/entry_contents.dart';
import '../models/memories.dart';

class HorizontalLayout extends StatelessWidget {

  final Memories memories;

  const HorizontalLayout({Key key, this.memories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: EntriesListView(memories: memories)),
        Expanded(child: EntryContents())
      ]);
  }
}