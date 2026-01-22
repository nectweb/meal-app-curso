import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  Widget _titleIngredient(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _listIngredients(Widget child) {
    return Container(
      width: 330,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 227, 212),
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            _titleIngredient("Ingredientes"),
            _listIngredients(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            _titleIngredient("Passos"),
            _listIngredients(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          child: Text("${index + 1}"),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        onPressed: () {
          Navigator.of(context).pop(meal.title);
        },
      ),
    );
  }
}
