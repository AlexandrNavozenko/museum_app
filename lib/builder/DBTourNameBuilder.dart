import 'package:flutter/material.dart';
import 'package:museum_app/models/DBTourName.dart';
import 'package:museum_app/utility/ObserverFuture.dart';

class DBTourNameBuilder extends StatelessWidget {
  @required
  final Function builder;
  final Future future;

  DBTourNameBuilder({this.builder, this.future});

  @override
  Widget build(BuildContext context) {
    return ObserverFuture<DBTourName>(
      future: future,
      onSuccess: (BuildContext context, DBTourName data) {
        return builder(context, data);
      },
    );
  }
}
