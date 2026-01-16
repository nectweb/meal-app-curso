import 'package:flutter/material.dart';
import 'package:meal/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: Center(child: Text("Receitas Por Categorias ${category.id}")),
    );
  }
}
