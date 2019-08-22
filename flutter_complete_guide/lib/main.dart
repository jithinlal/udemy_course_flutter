import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _questionIndex = 0;

  void _answerQuestions() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'what is your favorite color?',
        'answers': ['Black', 'Red', 'Blue', 'Green', 'White']
      },
      {
        'questionText': 'what is your favorite place?',
        'answers': ['Paris', 'New York', 'Mumbai', 'Hong Kong', 'Sydney']
      },
      {
        'questionText': 'what is your favorite animal?',
        'answers': ['Snake', 'Lion', 'Tiger', 'Panda', 'Dog']
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Question(
                questions[_questionIndex]['questionText'],
              ),
              ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestions, answer);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
