import 'package:categoryroute/category.dart';
import 'package:flutter/material.dart';

// TODO: Check if we need to import anything

// TODO: Define any constants

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: Create a list of the eight Categories, using the names and colors
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.
    List<Widget> categoryList = _buildListOfCategory();
    // TODO: Create a list view of the Categories
    final listView = Container(
      color: Colors.green[100],
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemBuilder: (context, index) => categoryList[index],
        itemCount: categoryList.length,
      ),

    );

    // TODO: Create an App Bar
    final appBar = AppBar(
      backgroundColor: Colors.green[100],
      centerTitle: true,
      elevation: 0.0,

      title: Text(
          'Unit Converter',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }

  List<Widget> _buildListOfCategory(){
    List<Widget> categoryList = List();
    for(int index = 0; index < _categoryNames.length; index++){
      Widget category = _buildCategory(_categoryNames[index], _baseColors[index], Icons.cake);
      categoryList.add(category);
    }
    return categoryList;
  }

  Widget _buildCategory(String name, ColorSwatch color, IconData icon){
    return Category(name: name, color: color, iconLocation: icon);
  }
}