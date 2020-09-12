import 'package:flutter/material.dart';
import 'package:meal_info/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  CategoryItem({Key key, @required this.title, @required this.color, @required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoryMealScreen.routeName,
          arguments: {
            'title': title,
            'id': id,
          },
        );
      },
      splashColor: color,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withOpacity(0.6),
              color.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}
