import 'package:flutter/material.dart';
import 'package:traveling_app/views/screens/category_trips_screen.dart';

import '../../models/category.dart';

class CategoryItem extends StatelessWidget {
  Category category;

  CategoryItem({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () {
       Navigator.pushNamed(context, CategoryTripsScreen.screenRoute,arguments: category);
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              category.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
          )
        ],
      ),
    );
  }
}
