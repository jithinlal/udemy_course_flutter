import 'package:flutter/material.dart';
import 'package:flutter_assignment_1/txtctrl.dart';
import 'package:flutter_assignment_1/txt.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Assignment 1',
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Txt(),
              Txtctrl(),
            ],
          ),
        ),
      ),
    );
  }
}
