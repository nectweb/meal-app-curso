import 'package:flutter/material.dart';
import 'package:meal/components/main_drawer.dart';
import 'package:meal/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChaged;

  const SettingsScreen({
    super.key,
    required this.onSettingsChaged,
    required this.settings,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

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
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChaged(settings);
      },
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
                  settings.isGlutenFree,
                  (value) {
                    setState(() {
                      settings.isGlutenFree = value;
                    });
                  },
                ),
                _createSwitch(
                  "Sem Lactose",
                  "Comida sem lactose",
                  settings.isLactoseFree,
                  (value) {
                    setState(() {
                      settings.isLactoseFree = value;
                    });
                  },
                ),
                _createSwitch(
                  "Comida vegana",
                  "Comidas veganas",
                  settings.isVegan,
                  (value) {
                    setState(() {
                      settings.isVegan = value;
                    });
                  },
                ),
                _createSwitch(
                  "Comida vegetariana",
                  "Comidas vegetarianas",
                  settings.isVegetarian,
                  (value) {
                    setState(() {
                      settings.isVegetarian = value;
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
