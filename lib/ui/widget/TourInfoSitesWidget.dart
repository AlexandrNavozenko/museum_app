import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_app/ui/widget/TourInfoSitesCardWidget.dart';

class TourInfoSitesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
        itemBuilder: (BuildContext ctxt, int index) {
          return TourInfoSitesCardWidget(index: index);
        }
    );
  }
}
