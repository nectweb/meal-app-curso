import 'package:flutter/material.dart';
import 'package:meal/components/main_drawer.dart';
import 'package:meal/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings _settings = Settings();

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configurações")),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Configurações!",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  "Sem Glutén",
                  "Comida sem glutén",
                  _settings.isGlutenFree,
                  (value) {
                    setState(() {
                      _settings.isGlutenFree = value;
                    });
                  },
                ),
                _createSwitch(
                  "Sem Lactose",
                  "Comida sem lactose",
                  _settings.isLactoseFree,
                  (value) {
                    setState(() {
                      _settings.isLactoseFree = value;
                    });
                  },
                ),
                _createSwitch(
                  "Comida vegana",
                  "Comidas veganas",
                  _settings.isVegan,
                  (value) {
                    setState(() {
                      _settings.isVegan = value;
                    });
                  },
                ),
                _createSwitch(
                  "Comida vegetariana",
                  "Comidas vegetarianas",
                  _settings.isVegetarian,
                  (value) {
                    setState(() {
                      _settings.isVegetarian = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
