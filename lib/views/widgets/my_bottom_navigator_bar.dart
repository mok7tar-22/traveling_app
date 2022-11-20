import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/main_screen_controller.dart';

class MyBottomNavigatorBar extends StatelessWidget {
  const MyBottomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        Provider.of<MainScreenController>(context, listen: false)
            .ChangeScreen(value);
      },
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.white,
      backgroundColor: Theme.of(context).primaryColor,
      currentIndex: Provider.of<MainScreenController>(context).currentScreen,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.category), label: "تصنيفات"),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: "المفضلة",
        ),
      ],
    );
  }
}
