import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_app/models/DBTourName.dart';
import 'package:museum_app/service/DBTourNameService.dart';
import 'package:museum_app/ui/DBTourDetailPage.dart';
import 'package:museum_app/ui/widget/DBTourInfoWidget.dart';

class DBCardWidget extends StatelessWidget {
  final DBTourName dbTour;

  const DBCardWidget({this.dbTour});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red[300],
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white70,
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Text(
              'Delete',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        DBTourNameService.deleteDBTour(dbTour);
        print(dbTour.name);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => DBTourDetailPage(
                  dbTourName: dbTour,
                ),
              ),
            );
          },
          title: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              dbTour.name,
              style: TextStyle(
                fontSize: 20.0,
                color: Theme.of(context).cardColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          subtitle: DBTourInfoWidget(dbTour: dbTour),
          trailing: Container(
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
