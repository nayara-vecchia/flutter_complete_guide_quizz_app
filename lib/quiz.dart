import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function handleAnswerQuestion;
  final List<Map<String, Object>> questionsData;
  int questionIndex;

  Quiz(
      {@required this.handleAnswerQuestion,
      @required this.questionsData,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    final questionText = questionsData[questionIndex]['questionText'] as String;
    final answers =
        questionsData[questionIndex]['answers'] as List<Map<String, Object>>;

    return Column(
      children: [
        Question(questionText),
        ...answers.map((answer) {
          final answerText = answer['text'];
          final answerScore = answer['score'];
          return Answer(() => handleAnswerQuestion(answerScore), answerText);
        }).toList(),
      ],
    );
  }
}
