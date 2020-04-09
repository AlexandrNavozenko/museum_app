import 'dart:async';

import 'package:museum_app/utility/Manager.dart';
import 'package:museum_app/utility/Validator.dart';
import 'package:rxdart/rxdart.dart';

class TourInfoFeedbackManager with Validation implements Manager {
  final _body = BehaviorSubject<String>();
  Stream<String> get body$ => _body.stream.transform(validateBody);
  Sink<String> get inBody => _body.sink;
  void setBody(String value) => _body.sink.add(value);

  final _rating = BehaviorSubject<double>();
  Stream<double> get rating$ => _rating.stream;
  Sink<double> get inRating => _rating.sink;
  void setRating(double value) => _rating.sink.add(value);

  Stream<bool> get isFormValid$ => Rx.combineLatest([body$, rating$], (value) => true);

  submit() {
      String body = _body.value;
      double rating = _rating.value;
      return 'Message: $body, Rating $rating star(s)';
  }

  void dispose() {
    _body.close();
    _rating.close();
  }
}
