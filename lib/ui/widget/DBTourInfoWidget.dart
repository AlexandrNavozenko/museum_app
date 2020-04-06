import 'package:flutter/material.dart';
import 'package:museum_app/models/DBTourName.dart';

class DBTourInfoWidget extends StatelessWidget {
  final DBTourName dbTour;

  const DBTourInfoWidget({this.dbTour});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.account_balance,
            color: Theme.of(context).cardColor,
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.directions_walk,
            color: Theme.of(context).cardColor,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            dbTour.distance,
            style: TextStyle(
              fontSize: 15.0,
              color: Theme.of(context).cardColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 30.0,
          ),
          Icon(Icons.access_time,
              color: Theme.of(context).cardColor),
          SizedBox(
            width: 5.0,
          ),
          Text(
            dbTour.time,
            style: TextStyle(
              fontSize: 15.0,
              color: Theme.of(context).cardColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 30.0,
          ),
          Icon(
            Icons.outlined_flag,
            color: Theme.of(context).cardColor,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            dbTour.points.toString(),
            style: TextStyle(
              fontSize: 15.0,
              color: Theme.of(context).cardColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
