import 'package:flutter/material.dart';
import 'package:meal/components/meal_item.dart';
import 'package:meal/models/meal.dart';

class FavoritiesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;
  const FavoritiesScreen(this._favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(child: Text("Minha comidas favoritas!"));
    } else {
      return ListView.builder(
        itemCount: _favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: _favoriteMeals[index]);
        },
      );
    }
  }
}
