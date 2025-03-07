import 'package:flutter/material.dart';
import 'package:state_management_course/vanilla_contacts/models/contact.dart';
import 'package:state_management_course/vanilla_contacts/view_model/contact_book_with_change_notifier.dart';

class VanillaNewContactViewWithChangeNotifier extends StatefulWidget {
  const VanillaNewContactViewWithChangeNotifier({super.key});

  @override
  State<VanillaNewContactViewWithChangeNotifier> createState() =>
      _VanillaNewContactViewWithChangeNotifierState();
}

class _VanillaNewContactViewWithChangeNotifierState
    extends State<VanillaNewContactViewWithChangeNotifier> {
  late TextEditingController _controller;
  final ContactBookWithChangeNotifier _contactBook =
      ContactBookWithChangeNotifier.instance;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Contact")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Enter a new contact here...",
              ),
            ),
            TextButton(
              onPressed: () {
                if (_controller.text.trim().isEmpty) return;
                final contact = Contact(name: _controller.text.trim());
                _contactBook.add(contact: contact);
                Navigator.pop(context);
              },
              child: const Text("Add Contact"),
            ),
          ],
        ),
      ),
    );
  }
}
