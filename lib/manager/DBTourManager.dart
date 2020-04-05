import 'dart:async';
import 'package:museum_app/models/DBTourName.dart';
import 'package:museum_app/models/Tour.dart';
import 'package:museum_app/service/DBTourNameService.dart';
import 'package:museum_app/service/TourService.dart';
import 'package:rxdart/rxdart.dart';

class DBTourManager {
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final PublishSubject<int> _countSubject = PublishSubject<int>();
  final PublishSubject<List<DBTourName>> _collectionSubject = PublishSubject<List<DBTourName>>();

  Sink<String> get inFilter => _filterSubject.sink;

  Stream<int> get count$ => _countSubject.stream;
  Stream<List<DBTourName>> get browse$ => _collectionSubject.stream;

  DBTourManager() {
      _filterSubject.debounceTime(Duration(milliseconds: 500))
          .switchMap((filter) async* {
        yield await DBTourNameService.browse(filter: filter);
      }).listen((dbTours) async {
        _collectionSubject.add(dbTours);
    });

    _collectionSubject.listen((list) => _countSubject.add(list.length));
  }

  void dispose() {
    _countSubject.close();
    _filterSubject.close();
  }
}