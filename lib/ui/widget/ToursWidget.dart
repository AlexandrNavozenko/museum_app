import 'package:flutter/material.dart';
import 'package:museum_app/ui/widget/DBTourCounter.dart';
import 'package:museum_app/ui/widget/DBTourList.dart';
import 'package:museum_app/ui/widget/TourCounter.dart';
import 'package:museum_app/ui/widget/TourList.dart';

class ToursWidget extends StatelessWidget {
  final bool isInternal;

  const ToursWidget({this.isInternal});

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
              isInternal ? 'assets/images/museum_5.jpg' : 'assets/images/museum_logo.jpg',
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
                isInternal ? DBTourCounter() : TourCounter(),
              ],
            ),
          ),
          isInternal ? DBTourList() : TourList(),
        ],
      ),
    );
  }
}
