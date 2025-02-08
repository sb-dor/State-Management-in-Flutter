import 'package:flutter/foundation.dart';

class OwnValueNotifier<T> with ChangeNotifier implements ValueListenable<T> {
  //
  OwnValueNotifier({required T value}) : _value = value;

  T _value;

  set value(T newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }

  @override
  T get value => _value;
}
