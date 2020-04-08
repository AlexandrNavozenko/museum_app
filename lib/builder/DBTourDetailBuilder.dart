import 'package:flutter/material.dart';
import 'package:museum_app/models/DBTourDetail.dart';
import 'package:museum_app/utility/ObserverFuture.dart';

class DBTourDetailBuilder extends StatelessWidget {
  @required
  final Function builder;
  final Future future;

  DBTourDetailBuilder({this.builder, this.future});

  @override
  Widget build(BuildContext context) {
    return ObserverFuture<DBTourDetail>(
      future: future,
      onSuccess: (BuildContext context, DBTourDetail data) {
        return builder(context, data);
      },
    );
  }
}
