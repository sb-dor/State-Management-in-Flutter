import 'dart:async';

import 'package:flutter/material.dart';

import 'publisher_subscriber.dart';

class OwnBlocBuilder<Bl extends OwnBloc<dynamic, S>, S> extends StatefulWidget {
  //
  const OwnBlocBuilder({super.key, required this.bloc, required this.child});

  final Bl bloc;
  final Widget Function(BuildContext context, S state) child;

  @override
  State<OwnBlocBuilder<Bl, S>> createState() => _OwnBlocBuilderState<Bl, S>();
}

class _OwnBlocBuilderState<Bl extends OwnBloc<dynamic, S>, S> extends State<OwnBlocBuilder<Bl, S>> {
  late final StreamSubscription<S> _stateSub;
  late S _state;

  @override
  void initState() {
    super.initState();
    _state = widget.bloc.state;
    _stateSub = widget.bloc.stream.cast<S>().listen(
      (state) => setState(() {
        _state = state;
      }),
    );
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

class PubSubPatternWidget extends StatefulWidget {
  const PubSubPatternWidget({super.key});

  @override
  State<PubSubPatternWidget> createState() => _PubSubPatternWidgetState();
}

class _PubSubPatternWidgetState extends State<PubSubPatternWidget> {
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
        body: Center(
          child: TextButton(
            onPressed: () {
              ownCounterBloc.add(Increment(1));
            },
            child: OwnBlocBuilder<CounterBloc, CounterStates>(
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
        ),
      ),
    );
  }
}
