import 'package:museum_app/manager/DBTourManager.dart';
import 'package:museum_app/manager/TourInfoFeedbackManager.dart';
import 'package:museum_app/manager/TourManager.dart';
import 'package:museum_app/utility/Manager.dart';

class Overseer {
  Map<dynamic, Manager> repository = {};

  Map<dynamic, Function> _factories = {
    TourManager: () => TourManager(),
    DBTourManager: () => DBTourManager(),
  TourInfoFeedbackManager: () => TourInfoFeedbackManager(),
  };

  static final Overseer _singleton = Overseer._internal();
  Overseer._internal();
  factory Overseer() => _singleton;

  _summon(name) => repository[name] = _factories[name]();

  fetch(name) => repository.containsKey(name) ? repository[name] : _summon(name);

  release(name) {
    var manager = repository[name];

    manager.dispose();

    repository.remove(name);
  }
}