import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Cyan', 'score': 10},
        {'text': 'White', 'score': 5},
        {'text': 'Purple', 'score': 9},
        {'text': 'Black', 'score': 4},
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Cat', 'score': 15},
        {'text': 'Dog', 'score': 20},
        {'text': 'Rabbit', 'score': 11},
        {'text': 'Horse', 'score': 7},
      ]
    },
    {
      'questionText': 'Who\'s your favourite celebrity?',
      'answers': [
        {'text': 'Elon Musk', 'score': 10},
        {'text': 'Daddy Yankee', 'score': 32},
        {'text': 'Margot Robbie', 'score': 14},
      ]
    },
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
      _questionIndex += 1;
    });
    // print(_questionIndex);
    // if (_questionIndex < _questions.length) {
    //   print('We have more questions!');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
