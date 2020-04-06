import 'package:flutter/material.dart';
import 'package:museum_app/manager/DBTourManager.dart';
import 'package:museum_app/utility/Observer.dart';
import 'package:museum_app/utility/Provider.dart';

class DBTourCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DBTourManager manager = Provider.of(context).fetch(DBTourManager);
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
