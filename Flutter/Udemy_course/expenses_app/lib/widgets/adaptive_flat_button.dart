import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {

  final String text;
  final Function handler;
  AdaptiveFlatButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {

    return Platform.isIOS
        ? CupertinoButton(
      onPressed: handler,
      child: Text(
        "Scegli la data",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    )
        : FlatButton(
      onPressed: handler,
      child: Text(
        "Scegli la data",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      textColor: Theme.of(context).primaryColor,
    );
  }
}
