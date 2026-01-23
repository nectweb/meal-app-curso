class Settings {
  bool isLactoseFree;
  bool isVegan;
  bool isGlutenFree;
  bool isVegetarian;

  Settings({
    this.isGlutenFree = false,
    this.isLactoseFree = false,
    this.isVegan = false,
    this.isVegetarian = false,
  });
}
