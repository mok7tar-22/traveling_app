import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app/controllers/filter_controller.dart';
import 'package:traveling_app/data/trips.dart';
import 'package:traveling_app/views/widgets/trip_item.dart';
import '../../models/category.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const screenRoute = '/category-trips';
  late Category category;
  List displayTrips = [];

  CategoryTripsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context)!.settings.arguments! as Category;
    displayTrips =
        Provider.of<FilterController>(context).filterTrip.where((trip) {
      return trip.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: displayTrips.length,
        itemExtent: MediaQuery.of(context).size.height * 0.25,
        itemBuilder: (context, index) {
          return TripItem(trip: displayTrips[index]);
        },
      ),
    );
  }
}
