import 'package:museum_app/manager/DBTourManager.dart';
import 'package:museum_app/manager/TourManager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer() {
    register(TourManager, TourManager());
    register(DBTourManager, DBTourManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) => repository[name];
}