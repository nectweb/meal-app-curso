import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/models/settings.dart';
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
  Settings settings = Settings();
  List<Meal> _avalaibleMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterSettings(Settings settings) {
    setState(() {
      this.settings = settings;

      _avalaibleMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

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
        '/': (ctx) => TabsScreen(_favoriteMeals),
        '/categories-meals': (ctx) =>
            CategoriesMealsScreen(meals: _avalaibleMeals),
        '/meals-details': (ctx) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        '/settings': (ctx) => SettingsScreen(
          onSettingsChaged: _filterSettings,
          settings: settings,
        ),
      },
    );
  }
}
