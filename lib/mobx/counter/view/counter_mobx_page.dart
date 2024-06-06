import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management_course/main.dart';

class CounterMobxPage extends StatelessWidget {
  const CounterMobxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter mobx page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Observer(
          builder: (_) => Text(counter.value.toString()),
        ),
      ),
    );
  }
}
