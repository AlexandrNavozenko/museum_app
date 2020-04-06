import 'package:flutter/material.dart';
import 'package:museum_app/manager/TourManager.dart';
import 'package:museum_app/ui/widget/DBTourCounter.dart';
import 'package:museum_app/ui/widget/ToursWidget.dart';
import 'package:museum_app/ui/widget/AppDrawer.dart';
import 'package:museum_app/utility/Provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFEDF0F6),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Museums łódź',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Select some settings ...'),
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                setState(() {
                  print('Update');
                  ToursWidget();
                });
              },
            ),
          ],
          bottom: TabBar(
            onTap: _onBarItemTap,
            tabs: <Widget>[
              Tab(text: 'TOURS'),
              Tab(
                text: 'LOADED TOUR',
              ),
            ],
          ),
        ),
        drawer: AppDrawer(),
        body: TabBarView(
          children: <Widget>[
            ToursWidget(isInternal: false),
            ToursWidget(isInternal: true),
          ],
        ),
      ),
    );
  }

  void _onBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
