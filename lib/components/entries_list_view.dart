import 'package:flutter/material.dart';

import '../models/entry.dart';
import '../models/memories.dart';

class EntriesListView extends StatelessWidget {

  final Memories memories;
  final void Function(BuildContext context, Entry entry) onTap;

  const EntriesListView({Key key, @required this.memories, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: memories.entryCount,
      itemBuilder: (context, index) {
        return ListTile(
          trailing: Icon(Icons.navigate_next),
          title: Text('${memories.entries[index].title}'),
          onTap: () => onTap(context, memories.entries[index])
        );
      }
    );
  }
}