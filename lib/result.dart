import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz; //function

  Result(this.resultScore, this.resetQuiz);

  String get result {
    var resultText = 'Quiz Complete! \n your score is $resultScore,';

    final perfectScore = resultScore == 3;
    if (perfectScore) {
      resultText += '\n you are the best!';
    } else {
      resultText += '\n :)';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    print(resultScore);
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              result,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: ElevatedButton(
              onPressed: resetQuiz,
              child: Text('Reset Quiz'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          )
        ],
      ),
    );
  }
}
