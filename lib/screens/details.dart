
import 'dart:js';
import 'package:midterm/data/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:midterm/data/repository/car_helper.dart';

class CarDetails extends StatefulWidget {
  static const routeName="/details-car";

  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  @override
  Widget build(BuildContext context) {
    final Car car=ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(

      ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        setState(() {
          CarsRepo().deleteCar(car.id);
         
          Navigator.pop(context);


        });

      },
      child: Icon(Icons.remove)
    ),

      body: SingleChildScrollView(
        child: Center(

          child:Center(
          child:  Column(
            children: [
              Image.network(car.imageUrl),
              Text(car.brand,),
              Text(
                car.model
              ),

              Text(
                car.year.toString()
              ),
              Text(
                car.description
              )
            ],

          ),
        ),

        ),



      ),

    );
  }
}
