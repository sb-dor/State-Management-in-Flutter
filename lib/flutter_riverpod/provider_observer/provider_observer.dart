import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Riverpod natively offers a way to listen to all events happening in the provider tree.
// This can be used to log all the events or to report errors to a remote service.
//
// This is achieved by using the ProviderObserver class, and passing it to ProviderScope/ProviderContainer.

//        ProviderScope(
//           observers: [
//             ProviderObserverHelper(),
//           ],
//           child: const MaterialApp(
class ProviderObserverHelper extends ProviderObserver {
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    debugPrint("provider added: ${provider.name}");
    super.didAddProvider(provider, value, container);
  }
}
