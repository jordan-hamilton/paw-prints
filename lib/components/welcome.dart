import 'package:flutter/material.dart';
import 'centered_image.dart';

class Welcome extends StatelessWidget {
  
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: padding(context)),
          child: Text(
            'Track the moments that matter most.',
            style: Theme.of(context).textTheme.headline,
            textAlign: TextAlign.center,
            
          ),
        ),
        Expanded(
          child: CenteredImage(
            image: Image.asset('assets/images/paw.png',
            fit: BoxFit.contain),
            padding: padding(context)
          ),
        ),
      ],
    );
  }
}

double padding(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.width * 0.05;
  } else {
    return MediaQuery.of(context).size.width * 0.2;
  }
}
