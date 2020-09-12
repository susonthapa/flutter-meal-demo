import 'package:flutter/material.dart';
import 'package:meal_info/screens/category_meals_screen.dart';
import 'package:meal_info/screens/filter_screen.dart';
import 'package:meal_info/screens/main_screen.dart';
import 'package:meal_info/screens/meal_details_screen.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final List<String> _favorites = [];
  Map<String, bool> filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false
  };

  void _toggleFavorites(String id) {
    setState(() {
      if (_favorites.contains(id)) {
        _favorites.remove(id);
      } else {
        _favorites.add(id);
      }
    });
  }

  bool _isFavorite(String id) {
    return _favorites.contains(id);
  }

  void _updateFilters(Map<String, bool> updatedFilters) {
    setState(() {
      filters = updatedFilters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff1fb62a),
        primaryColorLight: Color(0xff64e95c),
        primaryColorDark: Color(0xff008400),
        accentColor: Color(0xffb61fac),
        textTheme: TextTheme(
            headline5: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            )),
      ),
      home: HomeScreen(
        favoritesIds: _favorites,
        removeFavorite: _toggleFavorites,
      ),
      routes: {
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(filters: filters),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(
              toggleFavorites: _toggleFavorites,
              isFavorite: _isFavorite,
            ),
        FilterScreen.routeName: (ctx) => FilterScreen(currentFilter: filters, saveFilter: _updateFilters,)
      },
    );
  }
}
