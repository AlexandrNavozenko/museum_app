import 'package:museum_app/models/DBModelDefault.dart';

class Test extends DBModelDefault {
  static String table = 'tour_detail';

  int id;
  int tourNameIdFk;
  String picture;
  bool useGpsMap;
  String description;

  Test({
    this.id,
    this.tourNameIdFk,
    this.picture,
    this.useGpsMap,
    this.description
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'description': description,
      'picture': picture,
      'use_gpsmap': useGpsMap ? 1 : 0,
    };

    if (id != null) {
      map['id'] = id;
    }

    if (id != null) {
      map['tourname_id_fk'] = tourNameIdFk;
    }

    return map;
  }

  static Test fromMap(Map<String, dynamic> map) {
    return Test(
        id: map['id'],
        tourNameIdFk: map['tourname_id_fk'],
        description: map['description'],
        picture: map['picture'],
        useGpsMap: map['use_gpsmap'] == 1);
  }

  static String schema = '''
        CREATE TABLE IF NOT EXISTS `$table` (
        `id` INTEGER UNIQUE ON CONFLICT REPLACE,
        `tourname_id_fk` INTEGER DEFAULT 0,
        `picture` TEXT,
        `use_gpsmap` INTEGER,
        `description` TEXT DEFAULT NULL,
        FOREIGN KEY (`tourname_id_fk`) REFERENCES `tourname` (`id`)
      );
     
      ''';
}
