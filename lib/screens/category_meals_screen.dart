import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../widgets/dummy_data.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/categories';
  // final String id;
  // final String title;

  // CategoryMeals(this.id, this.title);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              affordability: categoryMeals[index].affordability,
              id: categoryMeals[index].id,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
