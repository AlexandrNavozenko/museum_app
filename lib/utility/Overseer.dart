import 'package:museum_app/manager/TourDetailManager.dart';
import 'package:museum_app/manager/TourManager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer() {
    register(TourManager, TourManager());
    register(TourDetailManager, TourDetailManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) => repository[name];
}