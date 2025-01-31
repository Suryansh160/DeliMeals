import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: Center(
        child: Text('recepy'),
      ),
    );
  }
}
