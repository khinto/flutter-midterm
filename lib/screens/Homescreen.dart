import 'dart:async';

import 'package:flutter/material.dart';
import 'package:midterm/data/models/car_model.dart';
import 'package:midterm/data/models/dummy_data.dart';
import 'package:midterm/screens/details.dart';
import 'package:midterm/screens/edit_car.dart';
import 'package:midterm/widgets/main_list_items.dart';

import 'add_new_car.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Car> carList = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: ListView.builder(itemBuilder: (ctx, index){
        var car = carList[index];
        return GestureDetector(
          onTap: () =>Navigator.pushNamed(context, CarDetails.routeName,arguments: car),
          onLongPress: () {
            Navigator.pushNamed(context,EditCar.routeName,arguments: {
              "car":car, "index":index
            }).then((_)  {setState(() {

            });}


             );
          },

          child: MainListItem(
            imageURL: car.imageUrl,
            name:car.brand ,
            year: car.year,

          ),
        );
      },
        itemCount: carList.length,

      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context,Addnewcar.routeName).then((_) {setState(() {
            {}
          });}),
          child: Icon(Icons.add),
        ),


    );
  }
}
