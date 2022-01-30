import 'package:flutter/material.dart';

import '../components/dropdown_rating_form_field.dart';
import '../db/database_manager.dart';
import '../db/entry_dto.dart';

class CreateEntryForm extends StatefulWidget {
  const CreateEntryForm({Key? key}) : super(key: key);

  @override
  _CreateEntryFormState createState() => _CreateEntryFormState();
}

class _CreateEntryFormState extends State<CreateEntryForm> {
  final _formKey = GlobalKey<FormState>();
  final newEntry = EntryDTO();

  void addDateToEntry() => newEntry.dateTime = DateTime.now();

  @override
  Widget build(BuildContext build) {
    return Padding(
        padding: const EdgeInsets.all(50),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: formFields(context),
            ),
          ),
        ));
  }

  List<Widget> formFields(BuildContext context) {
    return [
      const SizedBox(height: 10),
      TextFormField(
          autofocus: true,
          decoration: const InputDecoration(
              labelText: 'Title', border: OutlineInputBorder()),
          onSaved: (value) => newEntry.title = value,
          validator: (value) =>
              value!.isEmpty ? 'Please enter a title for this memory.' : null),
      const SizedBox(height: 10),
      TextFormField(
          decoration: const InputDecoration(
              labelText: 'Description', border: OutlineInputBorder()),
          keyboardType: TextInputType.multiline,
          minLines: 3,
          maxLines: null,
          onSaved: (value) => newEntry.description = value,
          validator: (value) => value!.isEmpty
              ? 'Please enter a description of this memory.'
              : null),
      const SizedBox(height: 10),
      DropdownRatingFormField(
          maxRating: 4,
          onSaved: (value) => newEntry.rating = value,
          validator: (value) =>
              value == null ? 'Please rate this memory' : null),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  addDateToEntry();
                  final databaseManager = DatabaseManager.getInstance();
                  databaseManager.saveEntry(dto: newEntry);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save this memory')),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          )
        ],
      )
    ];
  }
}
