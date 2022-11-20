import 'package:flutter/material.dart';
import 'package:traveling_app/views/widgets/categotry_item.dart';

import '../../data/categories.dart';

class CategoriesScreen extends StatelessWidget {
  static const screenRoute = '/category-screen';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categoriesData.length,
      padding: EdgeInsets.all(10),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1 / 2,
          mainAxisExtent: MediaQuery
              .of(context)
              .size
              .height * 0.3
      ),
      itemBuilder: (context, index) {
        return CategoryItem(category: categoriesData[index]);
      },
    );
  }
}
