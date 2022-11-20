import 'package:flutter/material.dart';
import 'package:traveling_app/data/trips.dart';
import 'package:traveling_app/models/trip.dart';

class FilterController with ChangeNotifier {
  List<Trip> filterTrip = tripsData;
  List<Trip> favorites = [];
  Map<String, bool> filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  void currentFilter(String category) {
    if (filters[category] == true) {
      filters[category] = false;
    } else {
      filters[category] = true;
    }
    notifyListeners();
  }

  void changeFilter() {
    filterTrip = [];
    filterTrip.addAll(tripsData.where((trip) {
      if (filters['summer'] == true && trip.isInSummer != true) {
        return false;
      }
      if (filters['winter'] == true && trip.isInWinter != true) {
        return false;
      }
      if (filters['family'] == true && trip.isForFamilies != true) {
        return false;
      }
      notifyListeners();
      return true;
    }));
    print(filterTrip);
  }

  void addFavorites(String id) {
    int existingIndex = favorites.indexWhere((trip) => trip.id == id);
    if (existingIndex >= 0) {
      favorites.removeAt(existingIndex);
    } else {
      favorites.add(filterTrip.firstWhere((trip) => trip.id == id));
      print(favorites);
    }
    notifyListeners();
  }

  bool isFavourite(String id) {
    return favorites.any((trip) => trip.id == id);
  }
}
// void changeFilter(String category){
//   if( filterTrip.){
//     filters[category]=false;
//   }else{
//     filters[category]=true;
//   }
//   notifyListeners();
// }
