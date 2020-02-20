import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String // 'final' means runtime constant even though it isn't compile time constant.
      questionText; // by adding final we can't re-assign any value to questionText

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double
          .infinity, // by this argument, Text takes the width of the device, and centers it.
      margin: EdgeInsets.all(25),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}
