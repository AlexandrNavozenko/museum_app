import 'package:flutter/material.dart';
import 'package:museum_app/models/DBTourName.dart';
import 'package:museum_app/ui/widget/DBCartDetailWidget.dart';

class DBTourDetailPage extends StatelessWidget {
  final DBTourName dbTour;

  const DBTourDetailPage({this.dbTour});

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
      body: DBCartDetailWidget(dbTour: dbTour),
    );
  }
}
