import 'package:flutter/material.dart';
import 'package:museum_app/model/Tour.dart';
import 'package:museum_app/ui/HomePage.dart';
import 'package:museum_app/ui/widget/TourPurchasedWidget.dart';

class TourPurchasedPAge extends StatelessWidget {
  final Tour tour;

  const TourPurchasedPAge({this.tour});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(tour.name)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
            ),
            onPressed: () => HomePage(),
          ),
        ],
      ),
      body: TourPurchasedWidget(tour: tour),
    );
  }
}
