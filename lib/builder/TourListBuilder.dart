import 'package:flutter/material.dart';
import 'package:museum_app/models/Tour.dart';
import 'package:museum_app/utility/Observer.dart';

class TourListBuilder extends StatelessWidget {
  @required
  final Function builder;
  final Stream stream;

  TourListBuilder({this.builder, this.stream});

  @override
  Widget build(BuildContext context) {
    return Observer<List<Tour>>(
      stream: stream,
      onSuccess: (BuildContext context, List<Tour> data) {
        return builder(context, data);
      },

      onWaiting: (context) => LinearProgressIndicator(),
    );
  }
}
