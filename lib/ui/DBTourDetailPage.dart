import 'package:flutter/material.dart';
import 'package:museum_app/models/DBTourName.dart';
import 'package:museum_app/ui/widget/DBCardDetailWidget.dart';

class DBTourDetailPage extends StatelessWidget {
  final DBTourName dbTourName;

  const DBTourDetailPage({this.dbTourName});

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
      body: DBCartDetailWidget(dbTourName: dbTourName),
    );
  }
}
