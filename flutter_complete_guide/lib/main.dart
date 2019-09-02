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
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Blue', 'score': 3},
        {'text': 'Green', 'score': 4},
        {'text': 'White', 'score': 5}
      ]
    },
    {
      'questionText': 'what is your favorite place?',
      'answers': [
        {'text': 'Paris', 'score': 1},
        {'text': 'New York', 'score': 2},
        {'text': 'Mumbai', 'score': 3},
        {'text': 'Hong Kong', 'score': 4},
        {'text': 'Sydney', 'score': 5}
      ]
    },
    {
      'questionText': 'what is your favorite animal?',
      'answers': [
        {'text': 'Snake', 'score': 1},
        {'text': 'Lion', 'score': 2},
        {'text': 'Tiger', 'score': 3},
        {'text': 'Panda', 'score': 4},
        {'text': 'Dog', 'score': 5}
      ]
    },
  ];
  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My First App',
          ),
        ),
        body: Center(
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestions,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(
                  _totalScore,
                  _resetQuiz,
                ),
        ),
      ),
    );
  }
}
