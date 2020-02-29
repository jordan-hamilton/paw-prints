import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/entry.dart';

class EntryContentsView extends StatelessWidget {

  final Entry entry;

  const EntryContentsView({Key key, this.entry}) : super(key: key);

  Widget stars() {
    final stars = List<Widget>.generate(entry.rating, (i) {
      return Icon(Icons.star);
    });
    return Row(
      children: stars,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {

    if (entry == null) {
      return Center(
        child: Text('Please select a memory.'),
      );
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          stars(),
          SizedBox(height: 10),
          Text(parseDate(entry.dateTime)),
          SizedBox(height: 10),
          Container(
            child: Text(
              '${entry.description}',
              style: Theme.of(context).textTheme.headline
            ),
            padding: EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }
}

String parseDate(DateTime dateTime) {
  return '${DateFormat("EEEE',' MMMM d',' y 'at' h':'m a").format(dateTime)}';
}