import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app/controllers/main_screen_controller.dart';
import 'package:traveling_app/views/screens/categories_screen.dart';
import 'package:traveling_app/views/screens/main_screen.dart';

import '../screens/filter_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: const Center(
              child: Text(
                'دليلك السياحي',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              if (ModalRoute.of(context)!.settings.name !=
                      MainScreen.routeName ||
                  Provider.of<MainScreenController>(context, listen: false)
                      .currentScreen != 0) {
                Provider.of<MainScreenController>(context, listen: false)
                    .currentScreen = 0;
                Navigator.of(context)
                    .pushReplacementNamed(MainScreen.routeName);
              }
            },
            leading: const Icon(
              Icons.card_travel,
              color: Colors.black,
              size: 30,
            ),
            title: const Text(
              'الرحلات',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          ListTile(
            onTap: () {
              if (ModalRoute.of(context)!.settings.name !=
                  FilterScreen.screenRoute)
                Navigator.of(context)
                    .pushReplacementNamed(FilterScreen.screenRoute);
            },
            leading: const Icon(
              Icons.filter_list,
              color: Colors.black,
              size: 30,
            ),
            title: const Text(
              'الفلترة',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
