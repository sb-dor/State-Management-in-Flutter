import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_course/provider/second_project/provider/datetime_provider.dart';

class DatetimeProviderWidget extends StatelessWidget {
  const DatetimeProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DatetimeProvider>();
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.purple,
      child: Column(
        children: [const Text("Datetime provider widget"), const Text("ID"), Text(provider.id)],
      ),
    );
  }
}
