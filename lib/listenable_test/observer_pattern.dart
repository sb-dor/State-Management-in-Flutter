// simple explanation of observer pattern in order to figure it out how it works
// but remember that change notifier was done better, with performance and working with memory
// you can create your own notifier but remember that do not use your own notifiers for projects!

import 'package:flutter/material.dart';

abstract interface class OwnListenable {
  void addSubscriber(VoidCallback subscriber);

  void removeSubscriber(VoidCallback subscriber);
}

// mixin class so we can create object from this mixin
mixin class SubscribersNotifier implements OwnListenable {
  //
  final List<VoidCallback> _subscribers = [];

  @override
  void addSubscriber(VoidCallback subscriber) {
    _subscribers.add(subscriber);
  }

  @override
  void removeSubscriber(VoidCallback subscriber) {
    for (int i = 0; i < _subscribers.length; i++) {
      if (_subscribers[i] == subscriber) {
        _subscribers.removeAt(i);
        break;
      }
    }
  }

  // calling each subscriber in order notify them all that someone called me
  void notifySubscribers() {
    for (final each in _subscribers) {
      each.call();
    }
  }

  void dispose() {
    _subscribers.clear();
  }
}

final class NotifiableClass {
  void justAFunctionThatCallsPrint() {
    print("JUST A FUNCTION THAT CALLS PRINT");
  }
}

final class CounterChangerNotifier with SubscribersNotifier {
  int counter = 1;

  void increment() {
    counter++;
    notifySubscribers();
  }
}

final class _OwnListenableBuilder extends StatefulWidget {
  //
  const _OwnListenableBuilder({
    required this.listenable,
    required this.child,
  });

  final OwnListenable listenable;
  final Widget Function(BuildContext context) child;

  @override
  State<StatefulWidget> createState() {
    return _OwnListenableState();
  }
}

final class _OwnListenableState extends State<_OwnListenableBuilder> {
  @override
  void initState() {
    super.initState();
    widget.listenable.addSubscriber(_listener);
  }

  @override
  void dispose() {
    widget.listenable.removeSubscriber(_listener);
    super.dispose();
  }

  void _listener() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.child(context);
  }
}

void main() async {
  final SubscribersNotifier subscribersNotifier = SubscribersNotifier();
  final NotifiableClass notifiableClass = NotifiableClass();

  subscribersNotifier.addSubscriber(notifiableClass.justAFunctionThatCallsPrint);

  subscribersNotifier.notifySubscribers();

  await Future.delayed(const Duration(seconds: 3));
  subscribersNotifier.notifySubscribers();
  await Future.delayed(const Duration(seconds: 3));
  subscribersNotifier.notifySubscribers();
  await Future.delayed(const Duration(seconds: 3));
  subscribersNotifier.removeSubscriber(notifiableClass.justAFunctionThatCallsPrint);
  print("removed subscriber");
  subscribersNotifier.notifySubscribers();

  runApp(
    MaterialApp(
      home: App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final CounterChangerNotifier _changerNotifier = CounterChangerNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Observer pattern"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            _changerNotifier.increment();
          },
          child: _OwnListenableBuilder(
            listenable: _changerNotifier,
            child: (context) => Text(
              "Increment: ${_changerNotifier.counter}",
            ),
          ),
        ),
      ),
    );
  }
}
