import 'package:flutter/material.dart';

class _InheritedScope extends InheritedWidget {
  final _InheritedScopesLearning1State inhScopeLearning1;

  const _InheritedScope({
    required super.child,
    required this.inhScopeLearning1,
  });

  static _InheritedScope? of(BuildContext context, {bool listen = true}) {
    if (listen) {
      final _InheritedScope? result = context.dependOnInheritedWidgetOfExactType<_InheritedScope>();
      assert(result != null, 'No _InheritedScope found in context');
      return result;
    } else {
      final result = context.getElementForInheritedWidgetOfExactType<_InheritedScope>()?.widget;
      return result is _InheritedScope ? result : null;
    }
  }

  @override
  bool updateShouldNotify(_InheritedScope old) {
    return old.inhScopeLearning1.counter != inhScopeLearning1.counter;
  }
}

class InheritedScopesLearning1 extends StatefulWidget {
  const InheritedScopesLearning1({super.key});

  @override
  State<InheritedScopesLearning1> createState() => _InheritedScopesLearning1State();
}

class _InheritedScopesLearning1State extends State<InheritedScopesLearning1> {
  int counter = 0;

  void increment() => setState(() {
        counter++;
        debugPrint("$counter");
      });

  void decrement() => setState(() {
        counter--;
        debugPrint("$counter");
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inherited learning 1"),
      ),
      body: _InheritedScope(
        inhScopeLearning1: this,
        child: const _BodyWidget(),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _IncrementButton(),
        _InformationOfData(),
        _DecrementButton(),
      ],
    );
  }
}

class _IncrementButton extends StatelessWidget {
  const _IncrementButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _InheritedScope.of(context, listen: false)?.inhScopeLearning1.increment();
      },
      child: const Text("Increment"),
    );
  }
}

class _InformationOfData extends StatelessWidget {
  const _InformationOfData();

  @override
  Widget build(BuildContext context) {
    final value = _InheritedScope.of(context)?.inhScopeLearning1.counter;
    return Text("$value");
  }
}

class _DecrementButton extends StatelessWidget {
  const _DecrementButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _InheritedScope.of(context, listen: false)?.inhScopeLearning1.decrement();
      },
      child: const Text("Decrement"),
    );
  }
}
