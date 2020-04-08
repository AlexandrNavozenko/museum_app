import 'package:flutter/material.dart';
import 'package:museum_app/builder/DBTourNameBuilder.dart';
import 'package:museum_app/models/Tour.dart';
import 'package:museum_app/service/DBTourNameService.dart';
import 'package:museum_app/ui/widget/CardDetailWidget.dart';
import 'package:museum_app/ui/widget/DBCardDetailWidget.dart';

class TourDetailPage extends StatelessWidget {
  final Tour tour;

  const TourDetailPage({this.tour});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Tour Detail')),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: CartDetailWidget(tour: tour),
//        body: DBTourNameBuilder(
//            future: DBTourNameService.singleBrowse(tourId: tour.id),
//            builder: (content, dbTourName) {
//              return dbTourName != null
//                  ? DBCartDetailWidget(dbTourName: dbTourName)
//                  : CartDetailWidget(tour: tour);
//            }),
    );
  }
}
