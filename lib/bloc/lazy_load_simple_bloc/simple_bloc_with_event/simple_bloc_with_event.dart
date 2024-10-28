// class

import 'dart:async';

import 'package:state_management_course/bloc/lazy_load_simple_bloc/models/simple_user.dart';
import 'package:state_management_course/bloc/lazy_load_simple_bloc/simple_bloc_state/simple_bloc_state.dart';

sealed class SimpleBlocEvents {}

class SimpleBlocIncrementEvent extends SimpleBlocEvents {}

class SimpleBlocDecrementEvent extends SimpleBlocEvents {}

class InitSimpleBlocEvent extends SimpleBlocEvents {}

class SimpleBlocWithEvent {
  late final SimpleBlocState _state;

  SimpleBlocState get state => _state;

  final _streamController = StreamController<SimpleBlocEvents>.broadcast(); // get events in

  late final Stream<SimpleBlocState> _stateStream;

  Stream<SimpleBlocState> get stateStream => _stateStream;

  SimpleBlocWithEvent() {
    addEvent(InitSimpleBlocEvent());
    _stateStream = _streamController.stream.asyncExpand<SimpleBlocState>(
      (event) async* {
        switch (SimpleBlocEvents) {
          case InitSimpleBlocEvent():
            yield _state = const SimpleBlocState(user: SimpleUser());
          case SimpleBlocIncrementEvent():
            yield* _increment();
          case SimpleBlocDecrementEvent():
            yield* _decrement();
        }
      },
    ).asBroadcastStream();
  }

  void addEvent(SimpleBlocEvents event) {
    _streamController.add(event);
  }

  Stream<SimpleBlocState> _increment() async* {
    yield _state.copyWith(user: _state.user.copyWith(age: _state.user.age! + 1));
  }

  Stream<SimpleBlocState> _decrement() async* {
    yield _state.copyWith(user: _state.user.copyWith(age: _state.user.age! - 1));
  }
}
