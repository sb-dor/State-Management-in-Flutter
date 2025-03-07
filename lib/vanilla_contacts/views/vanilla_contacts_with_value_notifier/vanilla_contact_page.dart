import 'package:flutter/material.dart';
import 'package:state_management_course/vanilla_contacts/view_model/contact_book.dart';

import 'vanilla_new_contact_view.dart';

class VanillaContactPage extends StatefulWidget {
  const VanillaContactPage({super.key});

  @override
  State<VanillaContactPage> createState() => _VanillaContactPageState();
}

class _VanillaContactPageState extends State<VanillaContactPage> {
  final contactBook = ContactBook.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home page")),
      body: ValueListenableBuilder(
        valueListenable: contactBook,
        builder: (context, value, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(8.0),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: value.length,
            itemBuilder: (context, index) {
              final contact = value[index];
              return Dismissible(
                key: UniqueKey(),
                onDismissed:
                    (direction) => contactBook.remove(contact: contact),
                child: Material(
                  elevation: 6.0,
                  child: ListTile(title: Text("${index + 1}. ${contact.name}")),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VanillaNewContactView(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
