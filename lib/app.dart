import 'package:flutter/material.dart';

class App extends StatelessWidget {

  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Layouts',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(title: Text('Adaptive Layouts')),
        body: Center(child: Text('Builder Demo')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('SNACKBAR!'),
              ));
          }),
        )
      );  
  }
}