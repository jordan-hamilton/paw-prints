import 'package:flutter/material.dart';

import '../models/memories.dart';

class EntriesListView extends StatelessWidget {

  final Memories memories;

  const EntriesListView({Key key, this.memories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: memories.entryCount,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.calendar_view_day),
          trailing: Icon(Icons.star),
          title: Text('${memories.entries[index].title}'),
        );
      }
    );
  }
}