import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/views/screens/trip_details_screen.dart';

import '../screens/category_trips_screen.dart';

class TripItem extends StatelessWidget {
  Trip trip;

  TripItem({required this.trip, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, TripDetailsScreen.screenRoute,
            arguments: trip);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      trip.imageUrl,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.8),
                        ],
                        stops: [0.6, 1],
                      ),
                    ),
                    child: Text(
                      trip.title,
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${trip.duration} أيام'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(trip.season.name),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(trip.tripType.name),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
