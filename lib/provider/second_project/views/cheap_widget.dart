import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_course/provider/second_project/models/cheap_datetime_model.dart';
import 'package:state_management_course/provider/second_project/provider/datetime_provider.dart';

class CheapWidget extends StatelessWidget {
  const CheapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cheapModel = context.select<DatetimeProvider, CheapDatetimeModel>(
      (providerValue) => providerValue.cheapDatetimeModel,
    );
    return Container(
      height: 100,
      color: Colors.amber,
      child: Column(
        children: [
          const Text("Cheap widget"),
          const Text("Last cheap updated "),
          Text(cheapModel.lastUpdateAt),
        ],
      ),
    );
  }
}
