import 'dart:async';
import 'package:state_management_course/bloc/lazy_load_simple_bloc/models/simple_user.dart';
import 'package:state_management_course/bloc/lazy_load_simple_bloc/simple_bloc_state/simple_bloc_state.dart';

class SimpleBloc {
  late SimpleBlocState _state;

  SimpleBlocState get initialState => _state;

  final _stateController = StreamController<SimpleBlocState>.broadcast();

  Stream<SimpleBlocState> get stateStream => _stateController.stream;

  SimpleBloc() {
    _init();
  }

  void _init() {
    _state = const SimpleBlocState(
      user: SimpleUser(name: "avaz", age: 22),
    );
    _stateController.add(_state);
  }

  void _updateState(SimpleBlocState state) {
    if (_state == state) return;
    _state = state;
    _stateController.add(_state);
  }

  void incrementAge() {
    var user = _state.user;
    user = user.copyWith(age: user.age! + 1);
    _updateState(_state.copyWith(user: user));
  }

  void decrementAge() {
    var user = _state.user;
    user = user.copyWith(age: user.age! - 1);
    _updateState(_state.copyWith(user: user));
  }
}
