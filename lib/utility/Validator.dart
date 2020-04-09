import 'dart:async';


mixin Validation {
  static bool isEmail(String email) => email.contains('@');

  final validateBody =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    int len = value.length;
    if (len == 0) {
      sink.addError('`MESSAGE` cannot be empty');
    } else if (len < 4) {
      sink.addError('`MESSAGE` cannot be shorter than 4 characters');
    } else {
      sink.add(value);
    }
  });

}