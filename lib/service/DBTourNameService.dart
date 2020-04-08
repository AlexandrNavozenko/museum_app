import 'package:museum_app/models/DBTourName.dart';
import 'package:museum_app/models/Tour.dart';
import 'package:museum_app/utility/DBProvider.dart';

class DBTourNameService {

  static Future<List<DBTourName>> browse({String filter}) async {

    List collection = await DBProvider.query(DBTourName.table);

    await Future.delayed(Duration(seconds: 1));

    Iterable<DBTourName> _dbToursName = collection.map((_) => DBTourName.fromMap(_));

    if (filter != null && filter.isNotEmpty) {
      _dbToursName = _dbToursName.where((dbToursName) => dbToursName.name.contains(filter));
    }

    return _dbToursName.toList();
  }

  static Future<DBTourName> singleBrowse({String tourId}) async {
    List collection = await DBProvider.query(DBTourName.table);

    if (collection.isNotEmpty) {
//      await Future.delayed(Duration(seconds: 3));
      Iterable<DBTourName> _dbToursName = collection.map((_) => DBTourName.fromMap(_));
      return _dbToursName.toList().singleWhere((dbTourName) => dbTourName.id == int.parse(tourId), orElse: () => null);
    }

    return null;
  }

  static void save({Tour tour}) async {

    DBTourName tourDB = DBTourName(
      id: int.parse(tour.id),
      purchasedIdFk: int.parse(tour.purchased_id_fk),
      name: tour.name,
      city: tour.city,
      state: tour.state,
      distance: tour.distance,
      points: int.parse(tour.points),
      time: tour.time
    );

    try {
      await DBProvider.insert(DBTourName.table, tourDB);
      List<Map<String, dynamic>> selectAll = await DBProvider.query(DBTourName.table);
      print(selectAll.isNotEmpty ? selectAll.length : 0);
    } catch (ex) {
      print('This tour has already been downloaded');
    }
  }

  static void deleteDBTour(DBTourName dbTour) async {
    await DBProvider.delete(DBTourName.table, dbTour);
  }
}
