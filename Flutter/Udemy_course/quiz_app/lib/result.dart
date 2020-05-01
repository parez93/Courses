import 'package:flutter/material.dart';
import 'package:quizapp/question.dart';
import 'package:quizapp/answer.dart';

class Result extends StatelessWidget {
  final totScore;
  final reset;

  Result(this.totScore, this.reset);

  String get resultPhase {
    String phase;
    if (totScore < 5) {
      phase = "Bad player";
    } else if (totScore < 10) {
      phase = "Good player";
    } else {
      phase = "Best player";
    }
    return phase;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhase,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          FlatButton(
              onPressed: reset,
              child: Text(
                "Nuova partita",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ))
        ],
      ),
    );
  }
}
