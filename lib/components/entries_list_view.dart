import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/entry.dart';
import '../models/memories.dart';

class EntriesListView extends StatelessWidget {
  final Memories? memories;
  final void Function(BuildContext context, Entry entry) onTap;

  const EntriesListView({Key? key, required this.memories, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: memories!.entryCount,
        itemBuilder: (context, index) {
          return ListTile(
              trailing: const Icon(Icons.navigate_next),
              title: Text('${memories!.entries![index].title}'),
              subtitle: Text(parseDate(memories!.entries![index].dateTime!)),
              onTap: () => onTap(context, memories!.entries![index]));
        });
  }
}

String parseDate(DateTime dateTime) {
  return DateFormat("EEEE',' MMMM d',' y 'at' h':'mm a").format(dateTime);
}
