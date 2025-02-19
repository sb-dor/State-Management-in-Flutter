import 'dart:async';

typedef EventHandler = FutureOr<void> Function();

abstract class OwnBlocBase<Event, State> {
  Future<void> close();

  Future<void> add(Event event);

  Future<void> emit(State state);

  void on<E extends Event>(EventHandler eventHandler);
}

abstract class OwnBloc<Event, State> extends OwnBlocBase<Event, State> {
  //
  OwnBloc(this._state);

  final List<({Event event, EventHandler eventHandler})> _events = [];

  final StreamController<State> _stateController = StreamController.broadcast();

  late State _state;

  Stream<State> get stream => _stateController.stream;

  State get state => _state;

  @override
  Future<void> add(Event event) async {
    for (final each in _events) {
      if (each.event == event) {
        await each.eventHandler();
      }
    }
  }

  @override
  Future<void> close() async {
    await _stateController.close();
  }

  @override
  void on<E extends Event>(EventHandler eventHandler) {
    for (final each in _events) {
      if (each.eventHandler is E) {
        throw Error(); // TODO: implement own error or add assert
      }
    }

    _events.add((event: E as Event, eventHandler: eventHandler));
  }

  @override
  Future<void> emit(State state) async {
    _state = state;
    _stateController.add(state);
  }
}

sealed class CounterEvents {}

class Increment extends CounterEvents {}

class Decrement extends CounterEvents {}

sealed class CounterStates {}

class CounterError extends CounterStates {}

class CounterSuccess extends CounterStates {
  CounterSuccess(this.cnt);

  final int cnt;
}

final class CounterBloc extends OwnBloc<CounterEvents, CounterStates> {
  //
  CounterBloc() : super(CounterSuccess(0)) {
    on<Increment>(_increment);

    on<Decrement>(_decrement);
  }

  void _increment() {
    if (state is! CounterSuccess) return;

    final currentState = state as CounterSuccess;

    int cnt = currentState.cnt;
    cnt++;
    emit(CounterSuccess(cnt));
  }

  void _decrement() {
    if (state is! CounterSuccess) return;

    final currentState = state as CounterSuccess;

    int cnt = currentState.cnt;
    cnt--;
    emit(CounterSuccess(cnt));
  }
}

void main() async {
  final ownCounterBloc = CounterBloc();

  final subs = ownCounterBloc.stream.listen((state) {
    if (state is CounterSuccess) {
      print("CounterSuccess: ${state.cnt}");
    } else {
      print("state is: $state");
    }
  });

  ownCounterBloc.add(Increment());

  await Future.delayed(const Duration(seconds: 3));

  ownCounterBloc.add(Increment());

  await Future.delayed(const Duration(seconds: 3));

  ownCounterBloc.add(Decrement());

  await Future.delayed(const Duration(seconds: 3));

  ownCounterBloc.add(Decrement());

  subs.cancel();
}
