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
  // called when a provider is added to the tree
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    debugPrint("provider added: ${provider.name}");
    super.didAddProvider(provider, value, container);
  }

  // called when a provider is updated
  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    debugPrint("provider disposed: ${provider.name}");
    super.didDisposeProvider(provider, container);
  }

  // called when a provider is disposed
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint("provider updated: ${provider.name}");
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  //  when a synchronous provider throws an error
  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    debugPrint('Provider $provider threw $error at $stackTrace');
    super.providerDidFail(provider, error, stackTrace, container);
  }
}
