import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  final questions = const [
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

  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex < questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
      print(_questionIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizzzzzzz'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
