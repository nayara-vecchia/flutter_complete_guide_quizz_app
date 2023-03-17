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
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color',
      'answers': [
        'Black',
        'Red',
        'White',
        'Green',
      ],
    },
    {
      'questionText': 'What\'s your favorite animal',
      'answers': [
        'Dog',
        'Cat',
        'Rabbit',
        'Horse',
      ],
    },
    {
      'questionText': 'Who\'s your favorite artist',
      'answers': [
        'taylor swift',
        'taylor swift',
        'taylor swift',
        'taylor swift',
      ],
    },
  ];

  int _questionIndex = 0;

  void _answerQuestion() {
    final isQuestionAnswered = _questionIndex < _questions.length - 1;

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
    final isQuizOn = _questionIndex < _questions.length;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizzzzzzz'),
        ),
        body: isQuizOn
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result()
      ),
    );
  }
}
