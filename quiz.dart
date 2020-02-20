import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String,Object>> question;
  final int questionIndex;
  final Function answerQuestion;
  Quiz({this.question,this.questionIndex,this.answerQuestion});
  @override
  Widget build(BuildContext context) {
    return  Column(
          children: <Widget>[
            //<Widget> is added to specify that the list contains widgets
            //Data input is done to the widget 'Question' that we created in 'questions'
            Question(question[questionIndex]
                ['questionText']), //indexing can be done in this fashion OR
            // by using .elementAt(_questionIndex) method.
            ...(question[questionIndex]['answer'] as List<Map<String,Object>>).map((n){
             return Answer(() => answerQuestion(n['score']),n['text']); 
            }).toList()//? as map() doesn't give list but iterable, so .toList() is used to generate a list.
            //the problem now is that we have a list, inside of another list(i.e Column[c1,c2,Answer[a1,a2,a3]] list)
            //... also called as spread operator is used to pull out the components of Answer and rearrange as follows
            //Column[c1,c2,a1,a2,a3]
          ],
        );
  }
}