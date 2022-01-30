import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/entry.dart';

class EntryContentsView extends StatelessWidget {
  final Entry? entry;

  const EntryContentsView({Key? key, this.entry}) : super(key: key);

  Widget stars() {
    final stars = List<Widget>.generate(entry!.rating!, (i) {
      return const Icon(Icons.star);
    });
    return Row(
      children: stars,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (entry == null) {
      return const Center(
        child: Text('Please select a memory.'),
      );
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          stars(),
          const SizedBox(height: 10),
          Text(parseDate(entry!.dateTime!)),
          const SizedBox(height: 10),
          Container(
            child: Text('${entry!.description}',
                style: Theme.of(context).textTheme.headline5),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }
}

String parseDate(DateTime dateTime) {
  return DateFormat("EEEE',' MMMM d',' y 'at' h':'mm a").format(dateTime);
}
