import 'dart:math';

import 'package:flutter/material.dart';

class ChangeNotifierTest extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}

class ValueNotifierTest extends ValueNotifier<int> {
  ValueNotifierTest(super.value);

  void increment() {
    value++;
    notifyListeners();
  }
}

class ListenableTest extends StatefulWidget {
  const ListenableTest({super.key});

  @override
  State<ListenableTest> createState() => _ListenableTestState();
}

class _ListenableTestState extends State<ListenableTest> {
  final _valueNotifier = ValueNotifierTest(1);
  final _changeNotifier = ChangeNotifierTest();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            _valueNotifier.increment();
          },
          child: const Text("Counter for ValueNotifier"),
        ),
        TextButton(
          onPressed: () {
            _changeNotifier.increment();
          },
          child: const Text("Counter for ChangeNotifier"),
        ),
        // listens only ValueListenable -> ValueNotifier, Animation
        ValueListenableBuilder(
          valueListenable: _valueNotifier,
          builder: (context, counter, child) {
            return Text(counter.toString());
          },
        ),
        // listens all Listenable ->  ValueNotifier, Animation, ChangeNotifier etc
        ListenableBuilder(
          listenable: _valueNotifier,
          builder: (context, child) {
            return Column(
              children: [
                const _TestRandom(),
                Text(
                  _valueNotifier.value.toString(),
                ),
              ],
            );
          },
        ),
        // listens all Listenable ->  ValueNotifier, Animation, ChangeNotifier etc
        ListenableBuilder(
          listenable: _changeNotifier,
          builder: (context, child) {
            return Column(
              children: [
                _TestRandom(),
                Text(_changeNotifier.counter.toString()),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _TestRandom extends StatelessWidget {
  const _TestRandom({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Random().nextInt(100).toString());
  }
}
