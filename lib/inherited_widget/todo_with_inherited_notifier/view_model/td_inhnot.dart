import 'package:flutter/widgets.dart';
import 'view_model/td_inh_view_model.dart';

class TdInhNot extends InheritedNotifier {
  final TdInhViewModel tdInhViewModel;

  const TdInhNot({
    super.key,
    required this.tdInhViewModel,
    required super.child,
  }) : super(notifier: tdInhViewModel);

  // it's necessary for listening and changing values
  static TdInhNot? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TdInhNot>();
  }

  // just for reading
  static TdInhNot? read(BuildContext context) {
    final element = context.getElementForInheritedWidgetOfExactType<TdInhNot>();
    if (element?.widget is TdInhNot) {
      return element?.widget as TdInhNot;
    }
    return null;
  }

// inheritedNotifier doesn't need updateShouldNotify because under the hood it extended inheritedWidget
// that is why inheritedNotifier is better than inheritedWidget

// @override
// bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//   // TODO: implement updateShouldNotify
//   throw UnimplementedError();
// }
}

// that is why here we can create our own changeNotifierProvider
// without using provider's changeNotifierProvider

// <T? extends ChangeNotifier> means that our class that we will
// provide here should be extended ChangeNotifier
class OwnChangeNotifierProvider<T extends ChangeNotifier> extends InheritedNotifier {
  final T provider;

  const OwnChangeNotifierProvider({
    super.key,
    required this.provider,
    required super.child,
  }) : super(notifier: provider);

  static T? watch<T extends ChangeNotifier>(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<OwnChangeNotifierProvider<T>>();
    return widget?.provider;
  }

  // just for reading
  static T? read<T extends ChangeNotifier>(BuildContext context) {
    final element = context.getElementForInheritedWidgetOfExactType<OwnChangeNotifierProvider<T>>();
    if (element?.widget is OwnChangeNotifierProvider<T>) {
      return (element?.widget as OwnChangeNotifierProvider<T>).provider;
    }
    return null;
  }
}
