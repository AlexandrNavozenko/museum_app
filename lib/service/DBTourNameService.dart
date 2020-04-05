import 'package:museum_app/models/DBTourName.dart';
import 'package:museum_app/models/Tour.dart';
import 'package:museum_app/utility/DBProvider.dart';

class DBTourNameService {

  static Future<List<DBTourName>> browse({String filter}) async {

    List collection = await DBProvider.query(DBTourName.table);

    await Future.delayed(Duration(seconds: 3));

    Iterable<DBTourName> _dbToursName = collection.map((_) => DBTourName.fromMap(_));

    if (filter != null && filter.isNotEmpty) {
      _dbToursName = _dbToursName.where((dbToursName) => dbToursName.name.contains(filter));
    }

    return _dbToursName.toList();
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
      var id = await DBProvider.insert(DBTourName.table, tourDB);
      print(id);
    } catch (ex) {
      print('This tour has already been downloaded');
    }
  }

}