import 'package:flutter/material.dart';
import 'package:museum_app/model/Tour.dart';

class TourPurchasedWidget extends StatelessWidget {
  final Tour tour;

  const TourPurchasedWidget({this.tour});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 250,
                  child: Image.asset(
                    'assets/images/museum_2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    tour.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).cardColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
