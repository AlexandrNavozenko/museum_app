
import 'dart:convert';

import 'package:museum_app/model/Tour.dart';
import 'package:http/http.dart' as http;

class TourService {
  static String _url = 'http://www.mocky.io/v2/5e7b791f2d00005c6311a17c';

  static Future<List<Tour>> browse({String filter}) async {
    http.Response response = await http.get(_url);

    await Future.delayed(Duration(seconds: 3));

    String content = response.body;

    List collection = json.decode(content);
    Iterable<Tour> _tours = collection.map((_) => Tour.fromJson(_));

    if (filter != null && filter.isNotEmpty) {
      _tours = _tours.where((tour) => tour.name.contains(filter));
    }

    return _tours.toList();
  }

}