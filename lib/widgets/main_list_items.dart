
import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {

  final String imageURL;
  final String name;
  final int year;



  MainListItem({this.imageURL,
    this.name,
    this.year,}
      // ignore: empty_constructor_bodies
      );


  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child:Column(
          children: [
            Container(
              child: FadeInImage(
                placeholder: AssetImage("assets/images/car_placeholder.png"),
                image:NetworkImage(imageURL),
                width: double.infinity,
                fit: BoxFit.cover ,
              ),
            ),
            Text(name),
            Text(year.toString()),
          ],
        )
      ),
    );
  }
}
