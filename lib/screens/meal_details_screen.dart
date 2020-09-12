import 'package:flutter/material.dart';
import 'package:meal_info/data/meals_data.dart';
import 'package:meal_info/models/meal.dart';

class MealDetailsScreen extends StatefulWidget {
  static const String routeName = '/meal-details';

  final Function toggleFavorites;
  final Function isFavorite;

  const MealDetailsScreen({Key key, @required this.toggleFavorites, @required this.isFavorite}) : super(key: key);

  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  bool _isInitialized = false;
  Meal _meal;

  @override
  void didChangeDependencies() {
    if (!_isInitialized) {
      final String mealId = ModalRoute.of(context).settings.arguments;
      _meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
      _isInitialized = true;
    }
    super.didChangeDependencies();
  }

  Widget _buildTitle(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  List<Widget> _buildMealAttributeList(List<String> ingredients) {
    final List<Widget> ingredientWidgets = [];
    for (int i = 0; i < ingredients.length; i++) {
      ingredientWidgets.add(ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Text("${i + 1}"),
        ),
        title: Text(
          ingredients[i],
        ),
      ));
    }
    return ingredientWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_meal.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.toggleFavorites(_meal.id);
        },
        child: widget.isFavorite(_meal.id) ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              child: Image.network(
                _meal.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            _buildTitle('Ingredients'),
            ..._buildMealAttributeList(_meal.ingredients),
            _buildTitle('Steps'),
            ..._buildMealAttributeList(_meal.steps),
          ],
        ),
      ),
    );
  }
}
