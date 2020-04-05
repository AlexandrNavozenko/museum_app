import 'package:museum_app/models/DBModelDefault.dart';

class DBTourDetail extends DBModelDefault {
  static String table = 'tour_detail';

  int id;
  int tourNameIdFk;
  String picture;
  bool useGpsMap;
  String description;

  DBTourDetail({
    this.id,
    this.tourNameIdFk,
    this.picture,
    this.useGpsMap,
    this.description,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'description': description,
      'picture': picture,
      'use_gpsmap': useGpsMap,
    };

    if (id != null) {
      map['id'] = id;
    }

    if (id != null) {
      map['tourname_id_fk'] = tourNameIdFk;
    }

    return map;
  }

  static DBTourDetail fromMap(Map<String, dynamic> map) {
    return DBTourDetail(
        id: map['id'],
        tourNameIdFk: map['tourname_id_fk'],
        description: map['description'],
        picture: map['picture'],
        useGpsMap: map['use_gpsmap'] == 1);
  }

  static String schema = '''
        CREATE TABLE IF NOT EXISTS `$table` (
        `id` INTEGER PRIMARY KEY,
        `tourname_id_fk` int(11) DEFAULT NULL,
        `picture` BLOB,
        `use_gpsmap` TINYINT(1),
        `description` text DEFAULT NULL,
        FOREIGN KEY (`tourname_id_fk`) REFERENCES `tourname` (`id`)
      );
      
      ''';
}
