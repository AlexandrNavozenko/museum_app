import 'package:flutter/material.dart';
import 'package:museum_app/builder/DBTourListBuilder.dart';
import 'package:museum_app/manager/DBTourManager.dart';
import 'package:museum_app/ui/widget/DBCardWidget.dart';
import 'package:museum_app/utility/Provider.dart';

class DBTourList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DBTourManager manager = Provider.of(context).fetch(DBTourManager);
    manager.inFilter.add('');

    return DBTourListBuilder(
      stream: manager.browse$,
      builder: (content, dbTours) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: dbTours?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return DBCardWidget(dbTour: dbTours[index]);
          },
        );
      },
    );
  }
}
