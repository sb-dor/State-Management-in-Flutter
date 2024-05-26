import 'package:flutter/material.dart';
import 'package:state_management_course/vanilla_contacts/models/contact.dart';
import 'package:state_management_course/vanilla_contacts/view_model/contact_book.dart';

class VanillaNewContactView extends StatefulWidget {
  const VanillaNewContactView({super.key});

  @override
  State<VanillaNewContactView> createState() => _VanillaNewContactViewState();
}

class _VanillaNewContactViewState extends State<VanillaNewContactView> {
  late TextEditingController _controller;
  late ContactBook _contactBook;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
    _contactBook = ContactBook.instance;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Contact"),
      ),
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
            )
          ],
        ),
      ),
    );
  }
}
