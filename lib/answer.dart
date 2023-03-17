import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback select; // Function
  final String answerText;

  Answer(this.select, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: Text(answerText),
        onPressed: select,
      ),
    );
  }
}
