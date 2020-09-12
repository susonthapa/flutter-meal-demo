import 'package:flutter/material.dart';
import 'package:meal_info/data/meals_data.dart';
import 'package:meal_info/models/category.dart';
import 'package:meal_info/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  final List<Category> categories = DUMMY_CATEGORIES;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          title: categories[index].title,
          color: categories[index].color,
          id: categories[index].id,
        );
      },
    );
  }
}
