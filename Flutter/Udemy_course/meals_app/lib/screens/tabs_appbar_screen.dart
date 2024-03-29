import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categories_screen.dart';
import 'package:mealsapp/screens/favourite_screen.dart';

class TabsAppBarScreen extends StatefulWidget {
  @override
  _TabsAppBarScreenState createState() => _TabsAppBarScreenState();
}

class _TabsAppBarScreenState extends State<TabsAppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.category,
              ),
              text: "Categories",
            ),
            Tab(
              icon: Icon(
                Icons.star,
              ),
              text: "Favourites",
            ),
          ]),
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          FavouriteScreen(null),
        ]),
      ),
    );
  }
}
