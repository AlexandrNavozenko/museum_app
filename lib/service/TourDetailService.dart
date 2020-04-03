import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:museum_app/models/TourDetail.dart';

class TourDetailService {
  static String _url = 'http://www.mocky.io/v2/5e833fe83100005b00e6449f';

  static Future<TourDetail> browse({String tourId}) async {
    http.Response response = await http.get(_url);

    await Future.delayed(Duration(seconds: 3));

    String content = response.body;

    List collection = json.decode(content);
    Iterable<TourDetail> _toursDetail = collection.map((_) => TourDetail.fromJson(_));
    var tourDetail = _toursDetail.toList().singleWhere((tourDetail) => tourDetail.tourname_id_fk == tourId, orElse: () => null);
    return tourDetail;
  }
}