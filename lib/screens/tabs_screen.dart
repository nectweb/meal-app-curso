import 'package:flutter/material.dart';
import 'package:meal/components/main_drawer.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/favorities_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreen = 0;

  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {"title": "Categorias", "screen": CategoriesScreen()},
      {"title": "Favoritos", "screen": FavoritiesScreen(widget.favoriteMeals)},
    ];
  }

  void _onSelected(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_screens[_selectedScreen]['title'] as String)),
      body: _screens[_selectedScreen]['screen'] as Widget,
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onSelected,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categorias",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favoritos"),
        ],
      ),
    );
  }
}
