import 'package:flutter/foundation.dart';
import 'package:state_management_course/redux/filtered_items/enums/filtered_items_enums.dart';

// THE WHOLE STATE OF APP THE KEEPS DATA
@immutable
class FilteredItemsState {
  final Iterable<String> items;
  final ItemFilter filter;

  const FilteredItemsState({required this.items, required this.filter});

  Iterable<String> get filteredItems {
    switch (filter) {
      case ItemFilter.all:
        return items;
      case ItemFilter.longTexts:
        return items.where((e) => e.length >= 10);
      case ItemFilter.shortTexts:
        return items.where((e) => e.length <= 3);
      }
  }
}
