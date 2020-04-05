import 'package:flutter/material.dart';
import 'package:museum_app/builder/TourListBuilder.dart';
import 'package:museum_app/manager/TourManager.dart';
import 'package:museum_app/ui/widget/CardWidget.dart';
import 'package:museum_app/utility/Provider.dart';

class TourList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TourManager manager = Provider.of(context).fetch(TourManager);
    manager.inFilter.add('');

    return TourListBuilder(
      stream: manager.browse$,
      builder: (content, tours) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tours?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return CardWidget(tour: tours[index]);
          },
        );
      },
    );
  }
}
