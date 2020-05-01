import 'package:flutter/material.dart';
import 'package:quizapp/question.dart';
import 'package:quizapp/answer.dart';

class Quiz extends StatelessWidget {

  final questions;
  final questionIndex;
  final answerQuestion;


  Quiz({@required this.questions, @required this.answerQuestion, @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Question(questions[questionIndex]["questionText"]),
          ...(questions[questionIndex]["answer"] as List<Map<String, Object>>)
              .map((answer) {
            return Answer(() => answerQuestion(answer["score"]), answer["text"]);
          }).toList(),
        ],
      ),
    );
  }
}
