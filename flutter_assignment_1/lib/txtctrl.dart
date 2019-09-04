import 'package:flutter/material.dart';

class Txtctrl extends StatelessWidget {
  final Function changeComment;

  Txtctrl({@required this.changeComment});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        'Change It!',
      ),
      onPressed: changeComment,
    );
  }
}
