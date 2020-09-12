import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_info/data/meals_data.dart';
import 'package:meal_info/models/meal.dart';

class FavoriteScreen extends StatefulWidget {
  final List<String> favoritesIds;
  final Function removeFavorite;

  const FavoriteScreen(
      {Key key, @required this.favoritesIds, @required this.removeFavorite})
      : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<Meal> _meals = DUMMY_MEALS;
  List<Meal> _favMeals;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _favMeals = _meals.where((meal) {
      return widget.favoritesIds.contains(meal.id);
    }).toList();
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      itemBuilder: (context, index) {
        final meal = _favMeals[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(meal.imageUrl),
          ),
          title: Text(
            meal.title,
            style: Theme.of(context).textTheme.headline5,
          ),
          trailing: IconButton(
            onPressed: () {
              widget.removeFavorite(meal.id);
            },
            icon: Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
          ),
        );
      },
      itemCount: _favMeals.length,
    );
  }
}
