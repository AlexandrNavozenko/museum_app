import 'dart:async';
import 'package:museum_app/model/Tour.dart';
import 'package:museum_app/service/TourService.dart';
import 'package:rxdart/rxdart.dart';

class TourManager {
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
//  final PublishSubject<int> _countSubject = PublishSubject<int>();
  final PublishSubject<List<Tour>> _collectionSubject = PublishSubject<List<Tour>>();

  Sink<String> get inFilter => _filterSubject.sink;

//  Stream<int> get count$ => _countSubject.stream;
  Stream<List<Tour>> get browse$ => _collectionSubject.stream;

  TourManager() {
    _filterSubject.debounceTime(Duration(milliseconds: 500)).listen((filter) async {
      var tours = await TourService.browse(filter: filter);
      _collectionSubject.add(tours);
    });

//    _collectionSubject.listen((list) => _countSubject.add(list.length));
  }

  void dispose() {
//    _countSubject.close();
    _filterSubject.close();
  }
}