import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_app/builder/TourDetailBuilder.dart';
import 'package:museum_app/model/Tour.dart';
import 'package:museum_app/service/TourDetailService.dart';
import 'package:museum_app/ui/Demo.dart';
import 'package:museum_app/ui/TourPurchasedPage.dart';
import 'package:museum_app/ui/widget/TourInfoWidget.dart';
import 'package:flutter_html/flutter_html.dart';

class CartDetailWidget extends StatelessWidget {
  final Tour tour;

  const CartDetailWidget({this.tour});

  @override
  Widget build(BuildContext context) {
    return TourDetailBuilder(
      future: TourDetailService.browse(tourId: tour.id),
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
                    TourInfoWidget(tour: tour),
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
              child: tour.purchased_id_fk != null
                  ? RaisedButton(
                      onPressed: () {
                        return Navigator.push(
                          context,
                          MaterialPageRoute(
//                            builder: (BuildContext context) => TourPurchasedPAge(tour: tour),
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
                    )
                  : RaisedButton(
                      onPressed: () => print('Need to buy tour'),
                      color: Colors.redAccent,
                      child: Text(
                        'BUY TOUR',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
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
