import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/main_screen_controller.dart';
import '../widgets/my_bottom_navigator_bar.dart';
import '../widgets/my_drawer.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = 'main-screen ';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainScreenController controller = MainScreenController.get(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          controller.title[controller.currentScreen],
        ),

      ),
      drawer: MyDrawer(),
      body: controller.screens[controller.currentScreen],
      bottomNavigationBar: MyBottomNavigatorBar(),
    );
  }
}
