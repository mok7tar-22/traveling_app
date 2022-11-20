import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app/controllers/filter_controller.dart';
import 'package:traveling_app/views/widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<FilterController>(context).favorites.isEmpty
        ? Center(
            child: Text("ليس لديك أي رحلة في قائمة المفضلة"),
          )
        : ListView.builder(
            itemCount: Provider.of<FilterController>(context).favorites.length,
            itemExtent: MediaQuery.of(context).size.height * 0.25,
            itemBuilder: (context, index) {
              return TripItem(
                  trip:
                      Provider.of<FilterController>(context).favorites[index]);
            },
          );
  }
}
