import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:state_management_course/provider/bread_crumb/models/bread_crumb.dart';

class BreadCrumbProvider extends ChangeNotifier {
  final List<BreadCrumb> _items = [];

  UnmodifiableListView<BreadCrumb> get items => UnmodifiableListView(_items);

  void add(BreadCrumb breadCrumb) {
    for (final item in _items) {
      item.activate();
    }
    _items.add(breadCrumb);
    notifyListeners();
  }

  void removeItem(BreadCrumb breadCrumb) {
    _items.removeWhere((e) => e.uuid == breadCrumb.uuid);
    if (_items.isNotEmpty) {
      _items.last.isActive = false;
    }
    notifyListeners();
  }

  void reset() {
    _items.clear();
    notifyListeners();
  }
}
