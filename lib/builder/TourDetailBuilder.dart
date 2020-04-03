import 'package:flutter/material.dart';
import 'package:museum_app/models/TourDetail.dart';
import 'package:museum_app/utility/ObserverFuture.dart';

class TourDetailBuilder extends StatelessWidget {
  @required
  final Function builder;
  final Future future;

  TourDetailBuilder({this.builder, this.future});

  @override
  Widget build(BuildContext context) {
    return ObserverFuture<TourDetail>(
      future: future,
      onSuccess: (BuildContext context, TourDetail data) {
        return builder(context, data);
      },
    );
  }
}
