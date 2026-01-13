import 'package:flutter/material.dart';
import 'package:meal/screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.amber,
          titleTextStyle: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.redAccent,
          secondary: Colors.redAccent,
          seedColor: Colors.amber,
        ),
        fontFamily: 'Raleway',
      ),
      home: CategoriesScreen(),
    );
  }
}
