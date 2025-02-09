import 'package:flutter/foundation.dart';

final class OwnValueNotifierListener<T> with ChangeNotifier implements ValueListenable<T> {
  //
  OwnValueNotifierListener(this._value);

  T _value;

  set value(T newValue) {
    if (_value == newValue) {
      return;
    }
    _value = newValue;
  }

  @override
  T get value => _value;
}
