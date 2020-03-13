import "package:flutter/material.dart";

import "./quiz.dart";
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "Blue", "score": 4},
        {"text": "Black", "score": 8},
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Dog", "score": 5},
        {"text": "Cat", "score": 3},
        {"text": "Lion", "score": 7},
        {"text": "Tiger", "score": 8},
      ],
    },
    {
      "questionText": "What's your favorite software language?",
      "answers": [
        {"text": "GO", "score": 2},
        {"text": "Javascript", "score": 1},
        {"text": "C", "score": 7},
        {"text": "Dart", "score": 8},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("First App"),
          ),
          // body: Text("Default Text"),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                  questionIndex: _questionIndex)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
