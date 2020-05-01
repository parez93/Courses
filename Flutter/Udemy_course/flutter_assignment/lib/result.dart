import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final resetIndex;

  Result(this.resetIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Testi finiti"),
          RaisedButton(onPressed:resetIndex, child: Text("Vuoi ricominciare?"),)
        ],
      ),
    );
  }
}
