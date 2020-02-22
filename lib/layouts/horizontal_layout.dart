import 'package:flutter/material.dart';

class HorizontalLayout extends StatelessWidget {
  
  const HorizontalLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Container(color: Colors.blue)),
        Expanded(child: Container(color: Colors.blueGrey))
      ]);
  }
}