import 'package:flutter/material.dart';
import 'package:museum_app/manager/TourManager.dart';
import 'package:museum_app/utility/Observer.dart';
import 'package:museum_app/utility/Provider.dart';

class TourCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TourManager manager = Provider.of(context).fetch(TourManager);
    manager.inFilter.add('');

    return Observer<int>(
      stream: manager.count$,
      onSuccess: (context, data) {
        return Chip(
          label: Text(
            (data ?? 0).toString(),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black45,
        );
      },
    );
  }
}
