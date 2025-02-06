import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../widgets/dummy_data.dart';
import '../models/meal.dart';

class displayedMeals extends StatefulWidget {
  static const routeName = '/categories';

  @override
  State<displayedMeals> createState() => _displayedMealsState();
}

class _displayedMealsState extends State<displayedMeals> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = DUMMY_MEALS.where(
        (meal) {
          return meal.categories.contains(categoryId);
        },
      ).toList();
      super.didChangeDependencies();
    }
  }

  void _remove(String mealId) {
    setState(() {
      displayedMeals?.removeWhere((meal) => meal.id == mealId);
      loadedInitData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? 'Default Title'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            affordability: displayedMeals![index].affordability,
            id: displayedMeals![index].id,
            complexity: displayedMeals![index].complexity,
            duration: displayedMeals![index].duration,
            imageUrl: displayedMeals![index].imageUrl,
            title: displayedMeals![index].title,
            removeItem: _remove,
          );
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
