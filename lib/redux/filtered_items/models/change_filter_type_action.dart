import 'package:flutter/foundation.dart';
import 'package:state_management_course/redux/filtered_items/enums/filtered_items_enums.dart';
import 'package:state_management_course/redux/filtered_items/models/filtered_actions.dart';

@immutable
class ChangeFilterTypeAction extends FilteredActions {
  final ItemFilter filter;

  const ChangeFilterTypeAction(this.filter);
}
