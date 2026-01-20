import 'package:flutter/material.dart';
import 'package:meal/components/meal_item.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = dummyMeals.where((dm) {
      return dm.categories.contains(category.id);
    }).toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 227, 212),
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: categoryMeals[index]);
        },
      ),
    );
  }
}
