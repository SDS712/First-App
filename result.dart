import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function quizResetter;
  Result(this.resultScore, this.quizResetter);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 3) {
      resultText = 'You have average Choices!';
    } else if (resultScore >= 12) {
      resultText = 'Your Choices are Unique!';
    } else {
      resultText = 'Good Choices!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            onPressed: quizResetter,
            color: Colors.lime,
          )
        ],
      ),
    );
  }
}
