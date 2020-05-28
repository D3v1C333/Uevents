import 'package:flutter/material.dart';
import 'package:uevents/screens/home.dart';

class SaveButton extends StatelessWidget {
  Function onPressed;

  SaveButton({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0.0),
                  side: BorderSide(color: Colors.pinkAccent)),
              onPressed: () {
                onPressed();
                LandingPage();
              },
              color: Colors.pinkAccent,
              textColor: Colors.white,
              child:
                  Icon(Icons.save),
            );
  }
}