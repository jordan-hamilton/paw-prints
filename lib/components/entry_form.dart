import 'package:flutter/material.dart';

import '../components/dropdown_rating_form_field.dart';
import '../db/database_manager.dart';
import '../db/entry_dto.dart';

class EntryForm extends StatefulWidget {
  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  
  final _formKey = GlobalKey<FormState>();
  final newEntry = EntryDTO();

  void addDateToEntry() => newEntry.dateTime = DateTime.now();

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
        onSaved: (value) => newEntry.title = value,
        validator: (value) =>
          value.isEmpty ? 'Please enter a title for this memory.' : null
      ),
      SizedBox(height: 10),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Description',
          border: OutlineInputBorder()
        ),
        keyboardType: TextInputType.multiline,
        minLines: 3,
        maxLines: null,
        onSaved: (value) => newEntry.description = value,
        validator: (value) =>
          value.isEmpty ? 'Please enter a description of this memory.' : null
      ),
      SizedBox(height: 10),
      DropdownRatingFormField(
        maxRating: 5,
        onSaved: (value) => newEntry.rating = value,
        validator: (value) =>
          value == null ? 'Please rate this memory' : null
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                addDateToEntry();
                final databaseManager = DatabaseManager.getInstance();
                databaseManager.saveEntry(dto: newEntry);
                Navigator.of(context).pop();
              }
            },
            child: Text('Save this memory')
          ),
          RaisedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
            color: Colors.red
          )
        ],
      )
    ];
  }
}
