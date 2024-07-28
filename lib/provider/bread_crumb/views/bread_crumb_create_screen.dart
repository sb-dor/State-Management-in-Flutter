import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_course/provider/bread_crumb/models/bread_crumb.dart';
import 'package:state_management_course/provider/bread_crumb/provider/bread_crumb_provider.dart';

class BreadCrumbCreateScreen extends StatefulWidget {
  const BreadCrumbCreateScreen({super.key});

  @override
  State<BreadCrumbCreateScreen> createState() => _BreadCrumbCreateScreenState();
}

class _BreadCrumbCreateScreenState extends State<BreadCrumbCreateScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create bread crumb",
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: "Add new breadcrump..."),
          ),
          TextButton(
            onPressed: () {
              if (_controller.text.trim().isEmpty) return;
              final breadCrumb = BreadCrumb(
                isActive: false,
                name: _controller.text.trim(),
              );
              context.read<BreadCrumbProvider>().add(breadCrumb);
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
