import 'package:museum_app/models/DBTourDetail.dart';
import 'package:museum_app/models/TourDetail.dart';
import 'package:museum_app/utility/DBProvider.dart';

class DBTourDetailService {
  static void save({TourDetail tourDetail}) async {

    DBTourDetail dbTourDetail = DBTourDetail(
        id: int.parse(tourDetail.id),
        tourNameIdFk: int.parse(tourDetail.tourname_id_fk),
        picture: tourDetail.imageUrl, // converter image to string
        useGpsMap: false,
        description: 'Internal data: ' + tourDetail.description,
    );

    try {
      await DBProvider.insert(DBTourDetail.table, dbTourDetail);
      List<Map<String, dynamic>> selectAll = await DBProvider.query(DBTourDetail.table);
      print(selectAll.isNotEmpty ? selectAll.length : 0);
    } catch (ex) {
      print('This tour_detail has already been downloaded');
    }
  }

  static void deleteDBTour(DBTourDetail dbTourDetail) async {
    await DBProvider.delete(DBTourDetail.table, dbTourDetail);
  }

  static void select() async {
    List<Map<String, dynamic>> _dbToursDetail = await DBProvider.query(DBTourDetail.table);
    print(_dbToursDetail.length);
  }

}
