import 'dart:async';

typedef CallbackHandler<Event, State> = Future<void> Function(Event event, State state);

abstract class OwnBloc<Event, State> {
  OwnBloc(this._state);

  final StreamController<Event> _eventController = StreamController<Event>.broadcast();
  final StreamController<State> _stateController = StreamController<State>.broadcast();
  State _state;
  late final Stream<State> _stream = _stateController.stream;

  State get state => _state;

  Stream<State> get stream => _stream;

  void on<E extends Event>(E event, CallbackHandler handler) {}

  void add(Event event) {
    _eventController.add(event);
  }

  void emit(State state) {
    _state = state;
    _stateController.add(state);
  }
}

class StartEvent {}

class FirstEvent extends StartEvent {}

class StartState {}

class SimpleBloc extends OwnBloc<StartEvent, StartState> {
  SimpleBloc(super.state) {
  }
}
