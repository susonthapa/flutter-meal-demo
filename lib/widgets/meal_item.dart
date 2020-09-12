import 'package:flutter/material.dart';
import 'package:meal_info/models/meal.dart';
import 'package:meal_info/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;

  const MealItem(
      {Key key,
      @required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.affordability,
      @required this.complexity,
      @required this.duration})
      : super(key: key);

  String _getAffordability(Affordability affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unknown";
    }
  }

  String _getComplexity(Complexity complexity) {
    switch (complexity) {
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Simple:
        return "Simple";
        break;
      default:
        return "Unknown";
    }
  }

  Widget _buildMealInfo(BuildContext context, IconData icon, String info) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 8,
          ),
          child: Text(info),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 16),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(MealDetailsScreen.routeName, arguments: id);
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Theme.of(context).accentColor.withOpacity(0.8),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMealInfo(
                    context,
                    Icons.access_time,
                    '$duration min',
                  ),
                  _buildMealInfo(
                    context,
                    Icons.work,
                    _getComplexity(complexity),
                  ),
                  _buildMealInfo(
                    context,
                    Icons.monetization_on,
                    _getAffordability(affordability),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
