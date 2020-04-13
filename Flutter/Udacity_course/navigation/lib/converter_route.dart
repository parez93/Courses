import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:navigation/category.dart';

import 'package:navigation/unit.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatelessWidget {
  /// Units for this [Category].
  final List<Unit> units;
  final ColorSwatch color;
  final String name;

  /// This [ConverterRoute] requires the color and units to not be null.
  // TODO: Pass in the [Category]'s color
  const ConverterRoute({
    @required this.units,
    @required this.color,
    @required this.name,
  }) : assert(units != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    final unitWidgets = units.map((Unit unit) {
      // TODO: Set the color for this Container
      return Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        color: this.color,
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      );
    }).toList();

    final appBar = AppBar(
      backgroundColor: this.color,
      title: Text(this.name),

    );

    return Scaffold(
      appBar: appBar,
      body: ListView(
        children: unitWidgets,
      ),
    );

  }
}