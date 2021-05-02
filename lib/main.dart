import 'package:flutter/material.dart';
import 'package:midterm/screens/Homescreen.dart';
import 'package:midterm/screens/add_new_car.dart';
import 'package:midterm/screens/details.dart';
import 'package:midterm/screens/edit_car.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cars App',
      theme: ThemeData(

        accentColor: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue)

          )
        )
      ),
      home: Homescreen(),
      routes: {
        CarDetails.routeName: (ctx) => CarDetails(),
        Addnewcar.routeName: (ctx) => Addnewcar(),
        EditCar.routeName: (ctx) => EditCar(),

      },
    );
  }
}

