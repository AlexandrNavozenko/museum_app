import 'package:flutter/material.dart';
import 'package:museum_app/ui/widget/DBTourList.dart';
import 'package:museum_app/ui/widget/TourList.dart';

class ToursWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250,
            child: Image.asset(
              'assets/images/museum_logo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'TOUR LIST',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black45),
                ),
                Icon(
                  Icons.map,
                  size: 25.0,
                  color: Colors.black45,
                ),
              ],
            ),
          ),
          TourList(),
        ],
      ),
    );
  }
}
