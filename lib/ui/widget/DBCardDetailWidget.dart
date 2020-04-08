import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_app/builder/DBTourDetailBuilder.dart';
import 'package:museum_app/models/DBTourName.dart';
import 'package:museum_app/service/DBTourDetailService.dart';
import 'package:museum_app/ui/TourInfoPage.dart';
import 'package:museum_app/ui/widget/DBTourInfoWidget.dart';
import 'package:flutter_html/flutter_html.dart';

class DBCartDetailWidget extends StatelessWidget {
  final DBTourName dbTourName;

  const DBCartDetailWidget({this.dbTourName});

  @override
  Widget build(BuildContext context) {
    return DBTourDetailBuilder(
      future: DBTourDetailService.browse(dbTourId: dbTourName.id),
      builder: (content, dbTourDetail) {
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
                        'assets/images/${dbTourDetail.picture}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        dbTourName.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).cardColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    Divider(),
                    DBTourInfoWidget(dbTour: dbTourName),
                    Divider(),
                    Html(
                      data: dbTourDetail.description,
                      padding: EdgeInsets.all(10.0),
                      defaultTextStyle: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
//              margin: EdgeInsets.symmetric(vertical: 5.0),
              child:
                  RaisedButton(
                onPressed: () {
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => TourInfoPage(),
                    ),
                  );
                },
                color: Colors.greenAccent,
                child: Text(
                  'START TOUR',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 20.0),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
