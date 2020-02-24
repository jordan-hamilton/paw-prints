import 'package:flutter/material.dart';
import '../models/entry.dart';

class EntryForm extends StatefulWidget {
  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  
  final _formKey = GlobalKey<FormState>();
  final journalEntry = Entry();

  @override
  Widget build(BuildContext build) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: formFields(context),
          ),
        ),
      )
    );
  }

  List<Widget> formFields(BuildContext context) {
    return [
      SizedBox(height: 5),
      TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: 'Title',
          border: OutlineInputBorder()
        ),
        onSaved: (value) {
          journalEntry.title = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a title for this memory.';
          } else {
            return null;
          }
        },
      ),
      SizedBox(height: 10),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Description',
          border: OutlineInputBorder()
        ),
        onSaved: (value) {
          journalEntry.description = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a description of this memory.';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.multiline,
        minLines: 3,
        maxLines: null
      ),
      SizedBox(height: 10),
      RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            print(journalEntry.toString());
            Navigator.of(context).pop();
          }
        },
        child: Text('Save this memory')
      )
    ];
  }
}
