import 'package:flutter/material.dart';
import 'package:museum_app/model/Tour.dart';
import 'package:museum_app/ui/TourDetailPage.dart';
import 'package:museum_app/ui/widget/TourInfoWidget.dart';

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
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => TourDetailPage(tour: tour,)),
          );
        },
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
        subtitle: TourInfoWidget(tour: tour),
        trailing: Container(
          child: Icon(Icons.check_circle_outline),
        ),
      ),
    );
  }
}
