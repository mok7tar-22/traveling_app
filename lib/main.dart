import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app/controllers/filter_controller.dart';
import 'package:traveling_app/controllers/main_screen_controller.dart';
import 'package:traveling_app/views/screens/categories_screen.dart';
import 'package:traveling_app/views/screens/category_trips_screen.dart';
import 'package:traveling_app/views/screens/filter_screen.dart';
import 'package:traveling_app/views/screens/main_screen.dart';
import 'package:traveling_app/views/screens/trip_details_screen.dart';

void main() {
  runApp(MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => MainScreenController()),
  ChangeNotifierProvider(create: (context) => FilterController()),


  ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // English, no country code
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline5: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  //  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
                headline6: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  //fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
              )),
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        CategoriesScreen.screenRoute:(context)=>CategoriesScreen(),
        CategoryTripsScreen.screenRoute: (context) => CategoryTripsScreen(),
        TripDetailsScreen.screenRoute: (context) => TripDetailsScreen(),
        FilterScreen.screenRoute: (context) => FilterScreen(),
      },
      initialRoute: MainScreen.routeName,
    );
  }
}
