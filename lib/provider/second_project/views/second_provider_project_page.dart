import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_course/provider/second_project/provider/datetime_provider.dart';
import 'package:state_management_course/provider/second_project/views/cheap_widget.dart';
import 'package:state_management_course/provider/second_project/views/datetime_provider_widget.dart';
import 'package:state_management_course/provider/second_project/views/expensive_widget.dart';

class SecondProviderProjectPage extends StatefulWidget {
  const SecondProviderProjectPage({super.key});

  @override
  State<SecondProviderProjectPage> createState() => _SecondProviderProjectPageState();
}

class _SecondProviderProjectPageState extends State<SecondProviderProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second provider app"),
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Expanded(child: CheapWidget()),
              SizedBox(width: 10),
              Expanded(child: ExpensiveWidget()),
            ],
          ),
          const SizedBox(height: 10),
          const DatetimeProviderWidget(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => context.read<DatetimeProvider>().stop(),
                child: const Text("Stop"),
              ),
              ElevatedButton(
                onPressed: () => context.read<DatetimeProvider>().start(),
                child: const Text("Start"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
