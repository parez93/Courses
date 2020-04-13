// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatelessWidget {
  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // TODO: You'll need the name, color, and iconLocation from main.dart
  final String name;
  final ColorSwatch color;
  final IconData icon;

  const Category({
      @required this.name,
      @required this.color,
      @required this.icon
  }) : assert(name != null),
        assert(color != null),
        assert(icon != null),
      super();
  final height = 100.0;

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
  Widget build(BuildContext context) {
    // TODO: Build the custom widget here, referring to the Specs.
    return Material(
      color: Colors.transparent,
      child: Container(
      height: height,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(height/2)),
      ),
      child: InkWell(
        onTap: () {print("I was tapped!");},
        splashColor: color,
        highlightColor: color,
        child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Icon(
                icon,
                size: 60.0,
              ),
            ),
          ),
          Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 24.0,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
      ),
    )
    );

  }
}