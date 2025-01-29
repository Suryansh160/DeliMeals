import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  const CategoryMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('the recepies'),
      ),
      body: Center(
        child: Text('recepy'),
      ),
    );
  }
}
