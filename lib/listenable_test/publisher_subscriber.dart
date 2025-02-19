import 'dart:async';

abstract class OwnBlocBase<Event> {
  Future<void> close();

  Future<void> add(Event event);
}

abstract class OwnBloc<Event> extends OwnBlocBase<Event> {
  final StreamController<Event> _eventController = StreamController.broadcast();

  Stream<Event> get stream => _eventController.stream;

  @override
  Future<void> add(Event event) async {
    _eventController.add(event);
  }

  @override
  Future<void> close() async {
    await _eventController.close();
  }
}

sealed class CounterEvents {}

class Increment extends CounterEvents {}

class Decrement extends CounterEvents {}

final class CounterBloc extends OwnBloc<CounterEvents> {



}
