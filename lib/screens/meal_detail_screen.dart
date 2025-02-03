import 'package:flutter/material.dart';

import '../widgets/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealsDetail';

  Widget title(String str, BuildContext ctx) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        str,
        style: Theme.of(ctx).textTheme.bodyLarge,
      ),
    );
  }

  Widget list(Widget child) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
      ),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    final mealId = routeArgs != null ? routeArgs as String : 'Unknown Meal';

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            padding: EdgeInsets.only(bottom: 10),
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Ingredients',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          list(
            ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.5),
                  child: Text(
                    selectedMeal.ingredients[index],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Text(
            'Steps',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          list(ListView.builder(
            itemBuilder: (ctx, indx) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${indx + 1}'),
                  ),
                  title: Text(
                    selectedMeal.steps[indx],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                )
              ],
            ),
            itemCount: selectedMeal.steps.length,
          ))
        ],
      ),
    );
  }
}
