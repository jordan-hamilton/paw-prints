import 'package:flutter/material.dart';

class CreateEntry extends StatelessWidget {

  static const routeName = 'createEntry';

  const CreateEntry({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Memory'
        )
      ),
      body: Container(
        child: Text('Form'),
        alignment: Alignment.center,
      )
    );
  }
}

void backToEntryList(BuildContext context) {
  Navigator.of(context).pop();
}