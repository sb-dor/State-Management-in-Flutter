import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:state_management_course/vanilla_contacts/models/contact.dart';

class ContactBookWithChangeNotifier with ChangeNotifier {
  ContactBookWithChangeNotifier._();

  static ContactBookWithChangeNotifier? _instance;

  static ContactBookWithChangeNotifier get instance =>
      _instance ??= ContactBookWithChangeNotifier._();

  final List<Contact> _contacts = [];

  UnmodifiableListView<Contact> get contacts => UnmodifiableListView(_contacts);

  int get length =>
      _contacts.length; // this value is from "ValueNotifier" getter variable

  void add({required Contact contact}) {
    _contacts.add(
      contact,
    ); // this value is from "ValueNotifier" getter variable
    notifyListeners();
  }

  void remove({required Contact contact}) {
    // this value is from "ValueNotifier" getter variable
    _contacts.removeWhere((e) => e.id == contact.id);
    notifyListeners();
  }

  Contact? contact({required int atIndex}) {
    // this value is from "ValueNotifier" getter variable
    return _contacts.length > atIndex ? _contacts[atIndex] : null;
  }
}
