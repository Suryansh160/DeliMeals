import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealsDetail';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    final mealId = routeArgs != null ? routeArgs as String : 'Unknown Meal';

    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: Center(
        child: Text('ahhh sweetie hit me hard $mealId'),
      ),
    );
  }
}
