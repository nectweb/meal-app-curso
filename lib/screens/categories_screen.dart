import 'package:flutter/material.dart';
import 'package:meal/components/categorie_item.dart';
import 'package:meal/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vamos Conzinhar?")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: dummyCategories.map((cat) {
            return CategorieItem(cat);
          }).toList(),
        ),
      ),
    );
  }
}
