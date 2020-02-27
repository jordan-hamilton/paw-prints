import 'package:flutter/material.dart';

import '../components/entries_list_view.dart';
import '../models/memories.dart';

class VerticalLayout extends StatelessWidget {

  final Memories memories;

  const VerticalLayout({Key key, this.memories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntriesListView(memories: memories);
  }
}

