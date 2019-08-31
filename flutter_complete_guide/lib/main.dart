import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import 'package:flutter_complete_guide/quiz.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _questions = [
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
  int _questionIndex = 0;

  void _answerQuestions() {
    if (_questionIndex < _questions.length) {}
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Center(
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestions,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(),
        ),
      ),
    );
  }
}
