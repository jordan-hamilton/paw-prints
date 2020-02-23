import 'package:flutter/material.dart';
import '../components/welcome.dart';

class HorizontalLayout extends StatelessWidget {
  
  const HorizontalLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Expanded(child: Container(color: Colors.amber)),
    //     Expanded(child: Container(color: Colors.blueGrey))
    //   ]);
    return Welcome();
  }
}