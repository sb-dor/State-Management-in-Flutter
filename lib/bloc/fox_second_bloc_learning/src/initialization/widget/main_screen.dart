// do not create your widgets of screen, pages etc here
// for learning purpose only!
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Hello world"),
      ),
    );
  }
}
