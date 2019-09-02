import 'package:flutter/material.dart';

class Txt extends StatefulWidget {
  @override
  _TxtState createState() => _TxtState();
}

class _TxtState extends State<Txt> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hai',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
