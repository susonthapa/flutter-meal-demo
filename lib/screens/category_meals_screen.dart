import 'package:flutter/material.dart';
import 'package:meal_info/data/meals_data.dart';
import 'package:meal_info/models/meal.dart';
import 'package:meal_info/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String routeName = '/category-meals';

  final Map<String, bool> filters;

  const CategoryMealScreen({Key key, @required this.filters}) : super(key: key);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  bool _isMealValidForFilter(Meal meal) {
    if (widget.filters['gluten'] && !meal.isGlutenFree) {
      return false;
    }

    if (widget.filters['lactose'] && !meal.isLactoseFree) {
      return false;
    }

    if (widget.filters['vegetarian'] && !meal.isVegetarian) {
      return false;
    }

    if (widget.filters['vegan'] && !meal.isVegan) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final List<Meal> meals = DUMMY_MEALS
        .where((meal) =>
            meal.categories.contains(categoryId) && _isMealValidForFilter(meal))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
        itemBuilder: (context, index) {
          final meal = meals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
