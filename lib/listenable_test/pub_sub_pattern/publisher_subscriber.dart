import 'dart:async';

typedef EventHandler<Event> = FutureOr<void> Function(Event event);

class Handler {
  Handler({required this.event, required this.handler});

  final FutureOr<void> Function(dynamic event) handler;
  Type event;
}

abstract class OwnBlocBase<Event, State> {
  Future<void> close();

  Future<void> add(Event event);

  Future<void> emit(State state);

  void on<E extends Event>(EventHandler eventHandler);
}

abstract class OwnBloc<Event, State> extends OwnBlocBase<Event, State> {
  //
  OwnBloc(this._state);

  final List<Handler> _events = [];

  final StreamController<State> _stateController = StreamController.broadcast();

  late State _state;

  Stream<State> get stream => _stateController.stream;

  State get state => _state;

  @override
  Future<void> add(Event event) async {
    for (final each in _events) {
      if (each.event == event.runtimeType) {
        await each.handler(event);
      }
    }
  }

  @override
  Future<void> close() async {
    await _stateController.close();
  }

  @override
  void on<E extends Event>(EventHandler<E> eventHandler) {
    assert(
      !_events.any((each) => each.event == E),
      'An event of type $E has already been registered.',
    );
    _events.add(Handler(event: E, handler: (event) => eventHandler(event)));
  }

  @override
  Future<void> emit(State state) async {
    _state = state;
    _stateController.add(state);
  }
}

sealed class CounterEvents {}

class Increment extends CounterEvents {
  Increment(this.initialValue);

  final int initialValue;
}

class Decrement extends CounterEvents {}

sealed class CounterStates {}

class CounterError extends CounterStates {}

class CounterSuccess extends CounterStates {
  CounterSuccess(this.cnt);

  final int cnt;
}

final class CounterBloc extends OwnBloc<CounterEvents, CounterStates> {
  //
  CounterBloc() : super(CounterSuccess(4)) {
    on<Increment>(_increment);

    on<Decrement>(_decrement);
  }

  void _increment(Increment increment) {
    if (state is! CounterSuccess) return;

    final currentState = state as CounterSuccess;

    int cnt = currentState.cnt;
    cnt = cnt + increment.initialValue;
    emit(CounterSuccess(cnt));
  }

  void _decrement(Decrement decrement) {
    if (state is! CounterSuccess) return;

    final currentState = state as CounterSuccess;

    int cnt = currentState.cnt;
    cnt--;
    emit(CounterSuccess(cnt));
  }
}
