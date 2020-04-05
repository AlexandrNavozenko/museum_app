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
import 'package:museum_app/ui/widget/TourInfoWidget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:museum_app/utility/DBProvider.dart';

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
                        _select();
                        _saveTour(tour);
                        _saveTourDetail(tourDetail);
                        return Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => HomePage(),
                          ),
                        );
                      },
                      color: Colors.greenAccent,
                      child: Text(
                        'DOWNLOAD TOUR',
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

  void _saveTourDetail(TourDetail tourDetail) async {
//    DBTourDetail tourDetailDB = DBTourDetail(
//        id: int.parse(tourDetail.id),
//        tourNameIdFk: int.parse(tourDetail.tourname_id_fk),
//        description: tourDetail.description,
//        useGpsMap: false,
//        picture: tourDetail.imageUrl);
//
//
//    print(await DBProvider.insert(DBTourDetail.table, tourDetailDB));
  }

  void _saveTour(Tour tour) async {
    DBTourName tourDB = DBTourName(
        id: int.parse(tour.id),
        purchasedIdFk: int.parse(tour.purchased_id_fk),
        name: tour.name,
        city: tour.city,
        state: tour.state,
        distance: tour.distance,
        points: int.parse(tour.points),
        time: tour.time);

    try {
      var id = await DBProvider.insert(DBTourName.table, tourDB);
      print(id);
    } catch (ex) {
      print('This tour has already been downloaded');
    }
  }

  void _select() async {
    List<Map<String, dynamic>> _dbToursName = await DBProvider.query(DBTourName.table);
    print(_dbToursName.length);
  }
}
