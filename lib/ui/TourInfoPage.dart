import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:museum_app/ui/HomePage.dart';
import 'package:museum_app/ui/widget/TourInfoFeedbackWidget.dart';
import 'package:museum_app/ui/widget/TourInfoMailWidget.dart';
import 'package:museum_app/ui/widget/TourInfoSitesWidget.dart';

class TourInfoPage extends StatefulWidget {
  @override
  _TourInfoPageState createState() => _TourInfoPageState();
}

class _TourInfoPageState extends State<TourInfoPage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Tour Info')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => HomePage(),
          ),
        ],
      ),
      body: [
        TourInfoSitesWidget(),
        TourInfoMainWidget(),
        TourInfoFeedbackWidget(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('SITES'),
            icon: Icon(
              Icons.toc,
              size: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('INFO'),
            icon: Icon(
              Icons.info,
              size: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('FEEDBACK'),
            icon: Icon(
              Icons.star,
              size: 30.0,
            ),
          ),
        ],
        onTap: _onBarItemTap,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
