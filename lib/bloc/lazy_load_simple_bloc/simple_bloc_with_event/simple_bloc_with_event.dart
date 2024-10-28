// class

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:state_management_course/bloc/lazy_load_simple_bloc/models/simple_user.dart';
import 'package:state_management_course/bloc/lazy_load_simple_bloc/simple_bloc_state/simple_bloc_state.dart';

sealed class SimpleBlocEvents {}

class SimpleBlocIncrementEvent extends SimpleBlocEvents {}

class SimpleBlocDecrementEvent extends SimpleBlocEvents {}

class InitSimpleBlocEvent extends SimpleBlocEvents {}

class SimpleBlocWithEvent {
  SimpleBlocState _state = const SimpleBlocState(user: SimpleUser(age: 10));

  SimpleBlocState get state => _state;

  final _eventController = StreamController<SimpleBlocEvents>.broadcast(); // get events in

  late final Stream<SimpleBlocState> _stateStream;

  Stream<SimpleBlocState> get stateStream => _stateStream;

  void close() {
    _eventController.close();
  }

  SimpleBlocWithEvent() {
    _stateStream = _eventController.stream.asyncExpand<SimpleBlocState>(
      (event) async* {
        switch (event) {
          case InitSimpleBlocEvent():
            yield _state = const SimpleBlocState(user: SimpleUser());
          case SimpleBlocIncrementEvent():
            debugPrint("hote medroya yo ne");
            yield* _increment();
          case SimpleBlocDecrementEvent():
            yield* _decrement();
        }
      },
    ).asBroadcastStream();

    addEvent(InitSimpleBlocEvent());
  }

  void addEvent(SimpleBlocEvents event) {
    _eventController.add(event);
  }

  Stream<SimpleBlocState> _increment() async* {
    var user = _state.user;
    user = user.copyWith(age: user.age! + 1);

    // Update _state with the new value
    _state = _state.copyWith(
      user: user,
    );

    yield _state; // Yield the updated state
  }

  Stream<SimpleBlocState> _decrement() async* {
    var user = _state.user;
    user = user.copyWith(age: user.age! - 1);

    // Update _state with the new value
    _state = _state.copyWith(
      user: user,
    );

    yield _state; // Yield the updated state
  }
}
