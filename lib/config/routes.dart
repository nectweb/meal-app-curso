import 'package:meal/screens/categories_meals_screen.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/meal_detail_screen.dart';

final routesCustom = {
  '/': (ctx) => CategoriesScreen(),
  '/categories-meals': (ctx) => CategoriesMealsScreen(),
  '/meals-details': (ctx) => MealDetailScreen(),
};
