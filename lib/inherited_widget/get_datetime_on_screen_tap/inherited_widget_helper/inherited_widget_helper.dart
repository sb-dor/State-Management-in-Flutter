import 'package:flutter/material.dart';
import 'package:state_management_course/inherited_widget/get_datetime_on_screen_tap/api/inh_api.dart';
import 'package:uuid/uuid.dart';

class InheritedWidgetHelper extends InheritedWidget {
  InheritedWidgetHelper({
    super.key,
    required super.child,
    required this.api,
  }) : uuid = const Uuid().v4();

  final InhApi api;

  // uuid is for changing inherited widget because inherited widget is constant and
  // should not be changed itself. In order to change this inherited widget we have to change
  // some value -> like this uuid below
  final String uuid;

  // it means that this function says: do I need to redraw your child, what will happen that I will change you child.
  @override
  bool updateShouldNotify(covariant InheritedWidgetHelper oldWidget) {
    // update while current uuid is not the oldWidget uuid
    return uuid != oldWidget.uuid;
  }

  // for listening
  static InheritedWidgetHelper of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedWidgetHelper>()!;
  }

  // for read, not listening
  static InheritedWidgetHelper read(BuildContext context) {
    final element = context.getElementForInheritedWidgetOfExactType<InheritedWidgetHelper>();
    return element?.widget as InheritedWidgetHelper;
  }
}
