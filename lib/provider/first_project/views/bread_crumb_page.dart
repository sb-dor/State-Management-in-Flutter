import 'package:flutter/material.dart';

class BreadCrumbPage extends StatefulWidget {
  const BreadCrumbPage({super.key});

  @override
  State<BreadCrumbPage> createState() => _BreadCrumbPageState();
}

class _BreadCrumbPageState extends State<BreadCrumbPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First provider page"),
      ),
    );
  }
}
