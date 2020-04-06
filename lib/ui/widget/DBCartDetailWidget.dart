import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_app/builder/TourDetailBuilder.dart';
import 'package:museum_app/models/DBTourName.dart';
import 'package:museum_app/models/DBTourDetail.dart';
import 'package:museum_app/models/DBTourName.dart';
import 'package:museum_app/models/Tour.dart';
import 'package:museum_app/models/TourDetail.dart';
import 'package:museum_app/service/DBTourNameService.dart';
import 'package:museum_app/service/TourDetailService.dart';
import 'package:museum_app/ui/Demo.dart';
import 'package:museum_app/ui/HomePage.dart';
import 'package:museum_app/ui/widget/DBTourInfoWidget.dart';
import 'package:flutter_html/flutter_html.dart';

class DBCartDetailWidget extends StatelessWidget {
  final DBTourName dbTour;

  const DBCartDetailWidget({this.dbTour});

  @override
  Widget build(BuildContext context) {
    return TourDetailBuilder(
      future: TourDetailService.browse(tourId: dbTour.id.toString()), // QWERTY
      builder: (content, tourDetail) {
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
                        'assets/images/${tourDetail.imageUrl}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        dbTour.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).cardColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    Divider(),
                    DBTourInfoWidget(dbTour: dbTour),
                    Divider(),
                    Html(
                      data: tourDetail.description,
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
                      builder: (BuildContext context) => Demo(),
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
