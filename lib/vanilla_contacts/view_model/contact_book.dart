import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:state_management_course/vanilla_contacts/models/contact.dart';

// in ValueNotifier you have to write what kind of type will be listened
// in order to change the state of screen
class ContactBook extends ValueNotifier<List<Contact>> {
  //
  ContactBook._() : super(<Contact>[]); // begin with a empty list

  static ContactBook? _instance;

  static ContactBook get instance => _instance ??= ContactBook._();

  int get length => value.length; // this value is from "ValueNotifier" getter variable

  void add({required Contact contact}) {
    value.add(contact); // this value is from "ValueNotifier" getter variable
    notifyListeners();
  }

  void remove({required Contact contact}) {
    // this value is from "ValueNotifier" getter variable
    value.removeWhere((e) => e.id == contact.id);
    notifyListeners();
  }

  Contact? contact({required int atIndex}) {
    // this value is from "ValueNotifier" getter variable
    return value.length > atIndex ? value[atIndex] : null;
  }
}
