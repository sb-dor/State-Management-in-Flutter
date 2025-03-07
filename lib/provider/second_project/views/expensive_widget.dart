import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_course/provider/second_project/models/expensive_datetime_model.dart';
import 'package:state_management_course/provider/second_project/provider/datetime_provider.dart';

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final expensiveModel = context
        .select<DatetimeProvider, ExpensiveDatetimeModel>(
          (providerValue) => providerValue.expensiveDatetimeModel,
        );
    return Container(
      height: 100,
      color: Colors.blue,
      child: Column(
        children: [
          const Text("Expensive widget"),
          const Text("Last updated "),
          Text(expensiveModel.lastUpdateAt),
        ],
      ),
    );
  }
}
