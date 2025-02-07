import 'package:flutter/material.dart';

final class ValueListenableTest extends ValueNotifier<int> {
  ValueListenableTest(super.initial);

  void increment() {
    value++;
    notifyListeners();
  }
}

class TestValueListenableWidget extends StatefulWidget {
  const TestValueListenableWidget({super.key});

  @override
  State<TestValueListenableWidget> createState() => _TestValueListenableWidgetState();
}

class _TestValueListenableWidgetState extends State<TestValueListenableWidget> {
  final _testValueListenable = ValueListenableTest(1);

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
                  return Text(value.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
