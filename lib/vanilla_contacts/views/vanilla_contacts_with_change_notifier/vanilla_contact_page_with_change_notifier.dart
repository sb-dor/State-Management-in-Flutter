import 'package:flutter/material.dart';
import 'package:state_management_course/vanilla_contacts/view_model/contact_book_with_change_notifier.dart';

import 'vanilla_new_contact_view_with_change_notifier.dart';

class VanillaContactWithChangeNotifierMaterialApp extends StatelessWidget {
  const VanillaContactWithChangeNotifierMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: VanillaContactPageWithChangeNotifier(),
    );
  }
}

class VanillaContactPageWithChangeNotifier extends StatefulWidget {
  const VanillaContactPageWithChangeNotifier({super.key});

  @override
  State<VanillaContactPageWithChangeNotifier> createState() =>
      _VanillaContactPageWithChangeNotifierState();
}

class _VanillaContactPageWithChangeNotifierState
    extends State<VanillaContactPageWithChangeNotifier> {
  //
  final contactBook = ContactBookWithChangeNotifier.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: ListenableBuilder(
          listenable: contactBook,
          builder: (context, child) {
            return ListView.separated(
              padding: const EdgeInsets.all(8.0),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: contactBook.length,
              itemBuilder: (context, index) {
                final contact = contactBook.contacts[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) => contactBook.remove(contact: contact),
                  child: Material(
                    elevation: 6.0,
                    child: ListTile(
                      title: Text("${index + 1}. ${contact.name}"),
                    ),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VanillaNewContactViewWithChangeNotifier(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
