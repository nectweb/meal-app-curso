import 'package:flutter/material.dart';
import 'package:meal/components/meal_item.dart';
import 'package:meal/models/category.dart';
import 'package:meal/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((dm) {
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
