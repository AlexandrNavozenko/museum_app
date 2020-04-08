import 'package:flutter/material.dart';
import 'package:museum_app/ui/Demo.dart';

class TourInfoSitesCardWidget extends StatelessWidget {
  final int index;

  const TourInfoSitesCardWidget({this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Demo(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 70.0,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/museum_3.jpg'),
                  radius: 30,
                ),
                SizedBox(width: 20.0,),
                Text(
                  'Text for site $index',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).cardColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
          child: Center(child: Icon(Icons.arrow_forward_ios, color: Theme.of(context).cardColor,),),
            )
          ],
        ),
      ),
    );
  }
}
