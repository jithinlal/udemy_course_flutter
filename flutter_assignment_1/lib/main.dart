import 'package:flutter/material.dart';
import 'package:flutter_assignment_1/txtctrl.dart';
import 'package:flutter_assignment_1/txt.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _comments = ['Hello, world!', 'Hai there', 'Karma'];
  int _index = 0;

  void _changeComment() {
    setState(() {
      _index += 1;
    });
  }

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
              Txt(
                comment: this._comments[this._index],
              ),
              Txtctrl(
                changeComment: _changeComment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
