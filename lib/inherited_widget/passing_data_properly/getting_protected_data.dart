import 'package:flutter/material.dart';

// just imagine that this class is one the child of "PassingDataWidget"
// when you want to get "surnameController" from PassingDataWidgetState
// it will not allow you, because it's "@protected"
class GettingProtectedData extends StatefulWidget {
  const GettingProtectedData({super.key});

  @override
  State<GettingProtectedData> createState() => _GettingProtectedDataState();
}

class _GettingProtectedDataState extends State<GettingProtectedData> {

  late final TextEditingController surnameController;

  @override
  void initState() {
    super.initState();
    // surnameController = PassingDataWidget.state(context).; // not visible
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
