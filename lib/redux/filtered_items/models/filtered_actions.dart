import 'package:flutter/foundation.dart';
import 'package:state_management_course/redux/filtered_items/enums/filtered_items_enums.dart';

// experienced developers
@immutable
abstract class FilteredActions {
  const FilteredActions();
}

@immutable
class ChangeFilterTypeAction extends FilteredActions {
  final ItemFilter filter;

  const ChangeFilterTypeAction(this.filter);
}
