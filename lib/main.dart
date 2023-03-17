import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // implementa o createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // 'const' constante na compilação e não 'final' constante na execução
  final _questionsData = const [
    {
      'questionText': 'What\'s your favorite color',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 0},
        {'text': 'White', 'score': 0},
        {'text': 'Green', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 1},
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Horse', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s your favorite artist',
      'answers': [
        {'text': 'taylor swift', 'score': 1},
        {'text': 'taylor swift', 'score': 1},
        {'text': 'taylor swift', 'score': 1},
        {'text': 'taylor swift', 'score': 1},
      ],
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

  void _handleAnswerQuestion(int score) {
    final isQuestionAnswered = _questionIndex < _questionsData.length - 1;
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });

    if (isQuestionAnswered) {
      print('tá on!');
    } else {
      print('cabou!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isQuizOn = _questionIndex < _questionsData.length;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quizzzzzzz'),
          ),
          body: isQuizOn
              ? Quiz(
                  handleAnswerQuestion: _handleAnswerQuestion,
                  questionsData: _questionsData,
                  questionIndex: _questionIndex,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
