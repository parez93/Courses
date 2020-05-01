import 'package:flutter/material.dart';
import 'package:flutterassignment/result.dart';

class TextControl extends StatefulWidget {
  @override
  _TextControlState createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  final listOfText = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "L",
    "M",
    "N",
    "O",
  ];

  var index = 0;

  void _overrideText() {
    setState(() {
      index++;
    });
  }

  void _resetIndex(){
    setState(() {
      index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: index < listOfText.length
          ? Column(
              children: <Widget>[
                Text(listOfText[index]),
                RaisedButton(
                  onPressed: _overrideText,
                  child: Text("Cambia testo"),
                ),
              ],
            )
          : Result(_resetIndex),
    );
  }
}
