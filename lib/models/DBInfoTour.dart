import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:museum_app/models/DBModelDefault.dart';

class DBInfoTour extends DBModelDefault {
  static const String TABLE = 'tour_info';

  @required
  int id;

  @required
  int tourNameIdFk;
  Html info;
  String picture;
  Html workTime;
  Html ticketPrice;
  Html contactUs;
  String lang;


  DBInfoTour({
    this.id,
    this.tourNameIdFk,
    this.info,
    this.lang,
    this.picture,
    this.workTime,
    this.ticketPrice,
    this.contactUs,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'info': info,
      'lang': lang,
      'picture': picture,
      'work_time': workTime,
      'ticket_price': ticketPrice,
      'contact_us': contactUs
    };

    if (id != null) {
      map['id'] = id;
    }

    if (id != null) {
      map['tourname_id_fk'] = tourNameIdFk;
    }

    return map;
  }

  static DBInfoTour fromMap(Map<String, dynamic> map) {
    return DBInfoTour(
        id: map['id'],
        tourNameIdFk: map['tourname_id_fk'],
        info: map['info'],
        lang: map['lang'],
        picture: map['picture'],
        workTime: map['work_time'],
        ticketPrice: map['ticket_price'],
        contactUs: map['contact_us']);
  }

  static String schema = '''
       CREATE TABLE IF NOT EXISTS `$TABLE` (
       `id` INTEGER PRIMARY KEY AUTOINCREMENT,
       `tourname_id_fk` int(11) DEFAULT NULL,
        `info` text DEFAULT NULL,
        `lang` varchar(50) DEFAULT NULL,
        `use_gpsmap` tinyint(1) DEFAULT NULL,
        `work_time` text DEFAULT NULL,
        `ticket_price` text DEFAULT NULL,
        `contact_us` text DEFAULT NULL,
        FOREIGN KEY (`tourname_id_fk`) REFERENCES `tourname` (`id`)
      );
      
      ''';
}
