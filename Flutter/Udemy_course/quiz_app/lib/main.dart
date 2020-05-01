import 'package:flutter/material.dart';
import 'package:quizapp/answer.dart';
import 'package:quizapp/question.dart';
import 'package:quizapp/quiz.dart';
import 'package:quizapp/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var totScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
      totScore += score;
    });
    print(_questionIndex);
    print(totScore);

  }

  void _reset(){
    setState(() {
      _questionIndex = 0;
      totScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        "questionText": "Come ti chiami?",
        "answer": [{"text":"Max", "score" : 10}, {"text":"Max", "score" : 5}, {"text":"Max", "score" : 2}, {"text":"Max", "score" : 1}]
      },
      {
        "questionText": "Quanti anni hai?",
        "answer": [{"text":"8", "score" : 10}, {"text":"8", "score" : 5}, {"text":"8", "score" : 2}]
      },
    ];


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz app"),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(totScore, _reset),
      ),
    );
  }
}
