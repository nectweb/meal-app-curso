import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/categories_meals_screen.dart';
import 'package:meal/screens/meal_detail_screen.dart';
import 'package:meal/screens/settings_screen.dart';
import 'package:meal/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Meal> _avalaibleMeals = dummyMeals;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.amber,
          titleTextStyle: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.red,
          secondary: Colors.red,
          seedColor: Colors.amber,
        ),

        fontFamily: 'RobotoCondensed',
      ),
      routes: {
        '/': (ctx) => TabsScreen(),
        '/categories-meals': (ctx) =>
            CategoriesMealsScreen(meals: _avalaibleMeals),
        '/meals-details': (ctx) => MealDetailScreen(),
        '/settings': (ctx) => SettingsScreen(),
      },
    );
  }
}
