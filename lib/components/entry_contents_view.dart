import 'package:flutter/material.dart';

import '../models/entry.dart';

class EntryContentsView extends StatelessWidget {

  final Entry entry;

  const EntryContentsView({Key key, this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (entry == null) {
      return Center(
        child: Text('Please select a memory.'),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: Text('${entry.description}'),
        ),
        Center(
          child: Text(entry.rating.toString()),
        ),
      ],
    );
  }
}