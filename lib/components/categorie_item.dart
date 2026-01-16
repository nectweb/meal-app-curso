import 'package:flutter/material.dart';
import 'package:meal/models/category.dart';

class CategorieItem extends StatelessWidget {
  final Category category;

  const CategorieItem(this.category, {super.key});

  void _selectCategorie(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoriesMealsScreen(category: category);
    //     },
    //   ),
    // );

    Navigator.of(context).pushNamed('/categories-meals', arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategorie(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.red,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [category.color.withValues(alpha: 0.5), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(category.title),
      ),
    );
  }
}
