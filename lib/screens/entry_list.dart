import 'package:flutter/material.dart';

import './create_entry.dart';
import '../layouts/horizontal_layout.dart';
import '../layouts/vertical_layout.dart';

class EntryList extends StatelessWidget {
  // TODO: Get data, then return either the welcome component or adaptive layout

  static const routeName = '/';

  const EntryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pup Memories'
        )
      ),
      body: LayoutBuilder(builder: layoutPicker),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pushCreateEntry(context),
        child: Icon(Icons.note_add) 
      ),
    );
  }
}

Widget layoutPicker(BuildContext context, BoxConstraints constraints) =>
  constraints.maxWidth < 800 ? VerticalLayout() : HorizontalLayout();

void pushCreateEntry(BuildContext context) => Navigator.of(context).pushNamed(CreateEntry.routeName);