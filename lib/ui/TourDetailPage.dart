import 'package:flutter/material.dart';
import 'package:museum_app/builder/TourDetailBuilder.dart';
import 'package:museum_app/manager/TourDetailManager.dart';
import 'package:museum_app/model/Tour.dart';
import 'package:museum_app/ui/widget/CartDetailWidget.dart';
import 'package:museum_app/ui/widget/TourInfoWidget.dart';
import 'package:museum_app/utility/Provider.dart';

class TourDetailPage extends StatelessWidget {
  final Tour tour;

  const TourDetailPage({this.tour});

  @override
  Widget build(BuildContext context) {
    TourDetailManager manager = Provider.of(context).fetch(TourDetailManager);
    manager.inFilter.add('');

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
