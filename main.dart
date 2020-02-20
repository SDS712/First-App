//with detailed documentation
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//main Function//

void main() {
  runApp(MyApp());
}

//First Class Defined//

class MyApp extends StatefulWidget {
//StatefulWidgets contains 2 classes unlike StatelessWidgets
//'extends' is used to extend the features of MyFirstApp to
//This is called inheritance
//'class MyFirstApp extends StatefulWidget' means that the pre-built class
//'StatefulWidget' is extended to MyFirstApp class where extra features/properties are added
//variables inside a class are called 'Properties'
//functions inside a class are called 'method'
  @override // done deliberately

//calling createState method//

  State<StatefulWidget> createState() {
    //a state is created called MyAppState()
    return _MyAppState(); // _MyAppState- It is then linked to MyApp
  }
}

//Second Class Defined//

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  // '_' is used to convert widgets from public to private
  void _resetter() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore =
        _totalScore + score; //can also be written as '_totalScore += score'
    setState(() {
      //re-calls build function for the Widget when the state is changed.
      //setState forces flutter to
      //re-render the UI
      // by calling build again to the class where you call the setState i.e MyAppState
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  var _questions = [
    //can add it anywhere// var is used to represent type of the object 'questions'
    //so that variable 'questions' can be re-assigned
    {
      'questionText':
          'What\'s your favourite color?', //in this way we can put single quotes inside a string.
      'answer': [
        {'text': 'Blue', 'score': 1},
        {'text': 'Red', 'score': 3},
        {'text': 'Green', 'score': 6},
        {'text': 'White', 'score': 8}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answer': [
        {'text': 'Rabbit', 'score': 6},
        {'text': 'Horse', 'score': 4},
        {'text': 'Dogs', 'score': 1},
        {'text': 'Cats', 'score': 2}
      ]
    },
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //Scaffold is a helper to create a base page design
        appBar: AppBar(
          //creates appbar on top
          title: Text(
              'Personality Tester'), //title takes the widget called 'text' not text itself
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                question: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(
                _totalScore,
                _resetter,
              ),
      ),
    );
  }
}
