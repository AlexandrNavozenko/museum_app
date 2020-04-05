import 'package:museum_app/models/DBModelDefault.dart';

class DBTourName extends DBModelDefault {
  static String table = 'tourname';

  int id;
  int purchasedIdFk;
  String name;
  String city;
  String state;
  String distance;
  String time;
  int points;

  DBTourName({
    this.id,
    this.purchasedIdFk,
    this.name,
    this.city,
    this.state,
    this.distance,
    this.time,
    this.points,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'purchased_id_fk': purchasedIdFk,
      'name': name,
      'city': city,
      'state': state,
      'distance': distance,
      'time': time,
      'points': points,
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  static DBTourName fromMap(Map<String, dynamic> map) {
    return DBTourName(
        id: map['id'],
        purchasedIdFk: map['purchased_id_fk'],
        name: map['name'],
        city: map['city'],
        state: map['state'],
        distance: map['distance'],
        time: map['time'],
        points: map['points']);
  }

  static String schema = '''
        CREATE TABLE IF NOT EXISTS `$table` (
        `id` INTEGER UNIQUE ON CONFLICT REPLACE,
        `purchased_id_fk` INTEGER DEFAULT 0,
        `name` TEXT DEFAULT NULL,
        `city` TEXT DEFAULT NULL,
        `state` TEXT DEFAULT NULL,
        `distance` TEXT DEFAULT NULL,
        `time` TEXT DEFAULT NULL,
        `points` INTEGER DEFAULT NULL                
      );
      
      ''';
}
