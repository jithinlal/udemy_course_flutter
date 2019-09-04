import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  final String comment;
  Txt({@required this.comment});
  @override
  Widget build(BuildContext context) {
    return Text(
      comment,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
