import 'package:flutter/foundation.dart';

typedef SetState<State extends Object> = void Function(State state);

abstract class Bloc<State extends Object> with ChangeNotifier {
  Bloc(State initialState) : _state = initialState;

  State get state => _state;
  State _state;

  bool get isProcessing => _isProcessing;
  bool _isProcessing = false;

  void setState(State state) {
    _state = state;
    notifyListeners();
  }

  Future<void> handle(
    Future<void> Function(SetState<State> setState) handler,
  ) async {
    if (_isProcessing) return;

    _isProcessing = true;

    notifyListeners();

    try {
      await handler(setState);
    } on Object {
      //Rethrow all errors to global observer,
      // and handle them in a single place
      rethrow;
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }
}
