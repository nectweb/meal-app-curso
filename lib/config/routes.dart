import 'package:meal/screens/categories_meals_screen.dart';
import 'package:meal/screens/meal_detail_screen.dart';
import 'package:meal/screens/settings_screen.dart';
import 'package:meal/screens/tabs_screen.dart';

final routesCustom = {
  '/': (ctx) => TabsScreen(),
  '/categories-meals': (ctx) => CategoriesMealsScreen(),
  '/meals-details': (ctx) => MealDetailScreen(),
  '/settings': (ctx) => SettingsScreen(),
};
