import 'dart:async';

import 'package:flutter/material.dart';

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

class OwnBlocBuilder<Bl extends OwnBloc, S> extends StatefulWidget {
  //
  const OwnBlocBuilder({
    super.key,
    required this.bloc,
    required this.child,
  });

  final Bl bloc;
  final Widget Function(BuildContext context, S state) child;

  @override
  State<OwnBlocBuilder> createState() => _OwnBlocBuilderState<Bl, S>();
}

class _OwnBlocBuilderState<Bl extends OwnBloc, S> extends State<OwnBlocBuilder> {
  late final StreamSubscription<S> _stateSub;
  late S _state;

  @override
  void initState() {
    super.initState();
    _state = widget.bloc.state;
    _stateSub = widget.bloc.stream.cast<S>().listen((state) => setState(() {
          _state = state;
        }));
  }

  @override
  void dispose() {
    _stateSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child(context, _state);
  }
}

void main() async {
  runApp(_App());
}

class _App extends StatefulWidget {
  const _App({super.key});

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  final ownCounterBloc = CounterBloc();
  late final StreamSubscription<CounterStates> _subs;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    _subs = ownCounterBloc.stream.listen((state) {
      if (state is CounterSuccess) {
        print("$state: ${state.cnt}");
      } else {
        print("state is: $state");
      }
    });

    ownCounterBloc.add(Increment(5));

    await Future.delayed(const Duration(seconds: 3));

    ownCounterBloc.add(Increment(3));

    await Future.delayed(const Duration(seconds: 3));

    ownCounterBloc.add(Decrement());

    await Future.delayed(const Duration(seconds: 3));

    ownCounterBloc.add(Decrement());
  }

  @override
  void dispose() {
    _subs.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: OwnBlocBuilder<CounterBloc, CounterStates>(
          bloc: ownCounterBloc,
          child: (context, state) {
            switch (state) {
              case CounterError():
                return Text("Error state");
              case CounterSuccess():
                return Text(state.cnt.toString());
            }
          },
        ),
      ),
    );
  }
}
