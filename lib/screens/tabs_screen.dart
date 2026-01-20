import 'package:flutter/material.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/favorities_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Vamos Conzinhar?", textAlign: TextAlign.center),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category), text: 'Categorias'),
              Tab(icon: Icon(Icons.star), text: "Favoritos"),
            ],
          ),
        ),
        body: TabBarView(children: [CategoriesScreen(), FavoritiesScreen()]),
      ),
    );
  }
}
