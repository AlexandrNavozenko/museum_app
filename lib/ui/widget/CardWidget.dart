import 'package:flutter/material.dart';
import 'package:museum_app/manager/TourManager.dart';
import 'package:museum_app/model/Tour.dart';
import 'package:museum_app/utility/Provider.dart';

class CardWidget extends StatelessWidget {
  final Tour tour;

  const CardWidget({this.tour});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        onTap: () {},
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            tour.name,
            style: TextStyle(
              fontSize: 20.0,
              color: Theme.of(context).cardColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        subtitle: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                '777',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Theme.of(context).cardColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        trailing: Container(
          child: Icon(Icons.check_circle_outline),
        ),
      ),
    );
  }
}
