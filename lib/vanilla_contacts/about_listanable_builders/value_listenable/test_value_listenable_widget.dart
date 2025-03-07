import 'package:flutter/material.dart';

final class AnyClass {
  final int number;

  AnyClass({this.number = 1});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnyClass &&
          runtimeType == other.runtimeType &&
          number == other.number);

  @override
  int get hashCode => number.hashCode;

  @override
  String toString() {
    return 'AnyClass{'
        ' number: $number,'
        '}';
  }

  AnyClass copyWith({int? number}) {
    return AnyClass(number: number ?? this.number);
  }
}

final class ValueListenableTest extends ValueNotifier<AnyClass> {
  ValueListenableTest(super.initial);

  void increment() {
    value = value.copyWith(number: value.number + 1);
    // you can call or not notifyListeners, because
    // take a look at implementation of this code and you will notice that
    // the setter of "value" automatically call notifyListeners under the hood

    // notifyListeners();
  }
}

class TestValueListenableWidget extends StatefulWidget {
  const TestValueListenableWidget({super.key});

  @override
  State<TestValueListenableWidget> createState() =>
      _TestValueListenableWidgetState();
}

class _TestValueListenableWidgetState extends State<TestValueListenableWidget> {
  final _testValueListenable = ValueListenableTest(AnyClass());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _testValueListenable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _testValueListenable.increment();
              },
              child: ValueListenableBuilder(
                valueListenable: _testValueListenable,
                builder: (context, value, child) {
                  return Text(value.number.toString());
                },
              ),
            ),
            //
            ListenableBuilder(
              listenable: _testValueListenable,
              builder: (context, child) {
                return child!;
              },
              // you can create this for those widgets that will not be rebuild again
              // when you put that inside builder
              child: Text("${_testValueListenable.value.number}"),
            ),

            AnimatedBuilder(
              animation: _testValueListenable,
              builder: (context, child) {
                return Text("${_testValueListenable.value.number}");
              },
            ),

            OwnListenableBuilder(
              listenable: _testValueListenable,
              child:
                  () => TextButton(
                    onPressed: () {
                      print(context.size);
                      print(MediaQuery.of(context).size.width);
                      print(MediaQuery.of(context).size.height);
                      _testValueListenable.increment();
                    },
                    child: Text("Test: ${_testValueListenable.value.number}"),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef WidgetBuilder = Widget Function();

class OwnListenableBuilder extends StatefulWidget {
  const OwnListenableBuilder({
    super.key,
    required this.listenable,
    required this.child,
  });

  final Listenable listenable;
  final WidgetBuilder child;

  @override
  State<StatefulWidget> createState() => _OwnListenableBuilderState();
}

class _OwnListenableBuilderState extends State<OwnListenableBuilder> {
  @override
  void initState() {
    super.initState();
    widget.listenable.addListener(_listenerHandler);
  }

  @override
  void dispose() {
    widget.listenable.removeListener(_listenerHandler);
    super.dispose();
  }

  void _listenerHandler() {
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.child();
}
