import 'package:flutter/material.dart';
import 'package:museum_app/ui/HomePage.dart';
import 'package:museum_app/utility/Overseer.dart';
import 'package:museum_app/utility/Provider.dart';

void main() => runApp(StoreApp());

class StoreApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer(),
      child: MaterialApp(
        title: 'Museums łódź App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blueAccent,
          cardColor: Colors.black54,
          accentColor: Colors.blue,
//          accentColor: Color(0xFFEDF0F6),
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
