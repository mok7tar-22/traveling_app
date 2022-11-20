import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app/views/screens/categories_screen.dart';
import 'package:traveling_app/views/screens/favorites_screen.dart';

class MainScreenController with ChangeNotifier {
  List screens = [CategoriesScreen(), FavoritesScreen()];
  List title = [
    "التصنيفات",
    "المفضلة",
  ];
  int currentScreen = 0;
  static MainScreenController get(context)=>Provider.of(context);
  void ChangeScreen(value) {
    currentScreen = value;
    notifyListeners();
  }
}

