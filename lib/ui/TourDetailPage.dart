import 'package:flutter/material.dart';
import 'package:museum_app/model/Tour.dart';
import 'package:museum_app/ui/widget/CartDetailWidget.dart';

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
    );
  }
}
