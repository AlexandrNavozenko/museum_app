import 'package:museum_app/model/TourDetail.dart';
import 'package:museum_app/service/TourDetailService.dart';
import 'package:rxdart/rxdart.dart';

class TourDetailManager {
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final PublishSubject<TourDetail> _collectionSubject = PublishSubject<TourDetail>();

  Sink<String> get inFilter => _filterSubject.sink;

  Stream<TourDetail> get browse$ => _collectionSubject.stream;

  TourDetailManager() {
    _filterSubject.listen((tourId) async {
      var tourDetail = await TourDetailService.browse(tourId: tourId);
      _collectionSubject.add(tourDetail);
    });
  }

  void dispose() {
    _filterSubject.close();
    _collectionSubject.close();
  }
}