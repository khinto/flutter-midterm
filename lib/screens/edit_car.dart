import 'package:flutter/material.dart';
import 'package:midterm/data/models/car_model.dart';
import 'package:midterm/data/repository/car_helper.dart';

import 'package:flutter/material.dart';

class EditCar extends StatefulWidget {
  static const routeName="/edit-car";

  @override
  _EditCarState createState() => _EditCarState();
}

class _EditCarState extends State<EditCar> {
  final _formKey=GlobalKey<FormState>();
   TextEditingController imageURl;
   TextEditingController carID;
 TextEditingController carBrand;
  TextEditingController carModel;
  TextEditingController carYear;
  TextEditingController carDescription;

  @override
  Widget build(BuildContext context) {
    final Map parsedData=ModalRoute.of(context).settings.arguments;
    final Car car=parsedData["car"];
    final int index=parsedData["index"];
    imageURl=TextEditingController(text: car.imageUrl.toString());

    carID=TextEditingController(text: car.id.toString());
    carBrand=TextEditingController(text: car. brand.toString());
    carModel=TextEditingController(text: car.model.toString());
    carYear=TextEditingController(text: car.year.toString());
    carDescription=TextEditingController(text: car.description.toString());
    return Scaffold(

      appBar: AppBar()
      ,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15,right:15, top: 15),
          child: Form(
            key:_formKey,
            child: Column(
              children: [
                Card(
                  child:TextFormField(
                    controller: imageURl,
                    decoration: InputDecoration(hintText: "Car image Url"),
                    keyboardType: TextInputType.url,

                  ),

                ),


                Card(
                  child:TextFormField(
                    controller: carID,
                    decoration: InputDecoration(hintText: "Car ID "),
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter valid ID";
                      }
                      return null;
                    },

                  ),

                ),
                Card(
                  child:TextFormField(
                    controller: carBrand,
                    decoration: InputDecoration(hintText: "Car brand "),

                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Required";
                      }
                      return null;
                    },

                  ),

                ),
                Card(
                  child:TextFormField(
                    controller: carModel,
                    decoration: InputDecoration(hintText: " Car model "),

                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Required";
                      }
                      return null;
                    },

                  ),

                ),
                Card(
                  child:TextFormField(
                    controller: carDescription,
                    decoration: InputDecoration(hintText: "Car description "),

                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Required";
                      }
                      return null;
                    },

                  ),

                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [


                    ElevatedButton(onPressed: ()=>Navigator.pop(context),
                      child: Text(
                          "back"
                      ),),
                    ElevatedButton(onPressed: () {
                      if (_formKey.currentState.validate()){
                        Car car=Car(
                          id: int.parse(carID.toString()),
                          brand: carBrand.text,
                          imageUrl: imageURl.text,
                          year: int.parse(carYear.text),
                          description: carDescription.text,



                        );
                        CarsRepo().editCar(car, index);
                        Navigator.pop(context);

                      }
                    } , child: Text("add")),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
