import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_app/ui/HomePage.dart';
import 'package:museum_app/ui/widget/RatingBarWidget.dart';

class TourInfoPageOld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour Info'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => HomePage(),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Text('data'),
            ),
          ),
          Container(
            color: Colors.blue,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () => print('object'),
                  splashColor: Colors.redAccent,
                  highlightColor: Colors.green,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.toc,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'SITES',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => print('object'),
                  splashColor: Colors.redAccent,
                  highlightColor: Colors.green,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.info,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'INFO',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => _AddFeedback(context),
                  splashColor: Colors.redAccent,
                  highlightColor: Colors.green,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'FEEDBACK',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _AddFeedback(BuildContext context) {
    String _task;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add new feedback"),
            actions: <Widget>[
              FlatButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop()),
              FlatButton(child: Text('Save'), onPressed: () => print(_task)),
            ],
            content: Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'write your feedback'),
                    onChanged: (value) {
                      _task = value;
                    },
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  RatingBarWidget(),
                ],
              ),
            ),
          );
        });
  }
}
