import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app/models/trip.dart';

import '../../controllers/filter_controller.dart';

class TripDetailsScreen extends StatelessWidget {
  static const screenRoute = '/trip_details_screen ';
  late Trip trip;

  TripDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    trip = ModalRoute.of(context)!.settings.arguments! as Trip;
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              trip.imageUrl,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "الانشطة",
                    style: Theme.of(context).textTheme.headline5,
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height * 0.25,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: trip.activities.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Text(trip.activities[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "البرنامج اليومي",
                    style: Theme.of(context).textTheme.headline5,
                  )),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height * 0.5,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(child: Text("يوم${index + 1}")),
                        title: Text(trip.program[index]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: trip.program.length))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            Provider.of<FilterController>(context, listen: false)
                .addFavorites(trip.id);
          },
          child: Provider.of<FilterController>(context).isFavourite(trip.id)
              ? Icon(
                  Icons.star,
                  color: Colors.black,
                )
              : Icon(
                  Icons.star_border,
                )),
    );
  }
}
