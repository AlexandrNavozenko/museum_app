import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo'),),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    height: 200.0,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 200.0,
                  ),
                  Container(
                    color: Colors.blueAccent,
                    height: 400.0,
                  ),

                ],
              ),
            ),
          ),
          Container(
            color: Colors.green,
            height: 200.0,
          ),
        ],
      ),

    );
  }
}
