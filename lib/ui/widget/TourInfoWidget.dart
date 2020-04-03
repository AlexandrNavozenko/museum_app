import 'package:flutter/material.dart';
import 'package:museum_app/model/Tour.dart';

class TourInfoWidget extends StatelessWidget {
  final Tour tour;

  const TourInfoWidget({this.tour});

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
            tour.distance,
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
            tour.time,
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
            tour.points,
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
