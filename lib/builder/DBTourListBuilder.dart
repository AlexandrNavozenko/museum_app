import 'package:flutter/material.dart';
import 'package:museum_app/models/DBTourName.dart';
import 'package:museum_app/utility/Observer.dart';

class DBTourListBuilder extends StatelessWidget {
  @required
  final Function builder;
  final Stream stream;

  DBTourListBuilder({this.builder, this.stream});

  @override
  Widget build(BuildContext context) {
    return Observer<List<DBTourName>>(
      stream: stream,
      onSuccess: (BuildContext context, List<DBTourName> data) {
        return builder(context, data);
      },
    );
  }
}
