import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createWidgetIcon(IconData icon, String label) {
    return ListTile(
      horizontalTitleGap: 0,
      leading: Icon(icon, size: 23),
      title: Text(
        label,
        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              "Vamos Conzinhar?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.amber,
              ),
            ),
          ),
          SizedBox(height: 10),
          _createWidgetIcon(Icons.restaurant_menu, "Restaurantes"),
          _createWidgetIcon(Icons.settings, "Configurações"),
        ],
      ),
    );
  }
}
