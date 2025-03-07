// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpod_trivia_state_with_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$riverpodTriviaStateWithNotifierHash() => r'f1d5586c49217ef71d3516cdec30be8bf47e8ad2';

/// See also [RiverpodTriviaStateWithNotifier].
@ProviderFor(RiverpodTriviaStateWithNotifier)
final riverpodTriviaStateWithNotifierProvider = AutoDisposeAsyncNotifierProvider<
  RiverpodTriviaStateWithNotifier,
  List<RiverpodNumberTriviaModel>
>.internal(
  RiverpodTriviaStateWithNotifier.new,
  name: r'riverpodTriviaStateWithNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$riverpodTriviaStateWithNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RiverpodTriviaStateWithNotifier =
    AutoDisposeAsyncNotifier<List<RiverpodNumberTriviaModel>>;
String _$otherRiverpodForTheCombiningProvidersHash() => r'b022cf83dc4c7b3c206340fe99f5b15a9856a0a1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$OtherRiverpodForTheCombiningProviders
    extends BuildlessAutoDisposeAsyncNotifier<int> {
  late final int duration;

  FutureOr<int> build(int duration);
}

/// See also [OtherRiverpodForTheCombiningProviders].
@ProviderFor(OtherRiverpodForTheCombiningProviders)
const otherRiverpodForTheCombiningProvidersProvider = OtherRiverpodForTheCombiningProvidersFamily();

/// See also [OtherRiverpodForTheCombiningProviders].
class OtherRiverpodForTheCombiningProvidersFamily extends Family<AsyncValue<int>> {
  /// See also [OtherRiverpodForTheCombiningProviders].
  const OtherRiverpodForTheCombiningProvidersFamily();

  /// See also [OtherRiverpodForTheCombiningProviders].
  OtherRiverpodForTheCombiningProvidersProvider call(int duration) {
    return OtherRiverpodForTheCombiningProvidersProvider(duration);
  }

  @override
  OtherRiverpodForTheCombiningProvidersProvider getProviderOverride(
    covariant OtherRiverpodForTheCombiningProvidersProvider provider,
  ) {
    return call(provider.duration);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'otherRiverpodForTheCombiningProvidersProvider';
}

/// See also [OtherRiverpodForTheCombiningProviders].
class OtherRiverpodForTheCombiningProvidersProvider
    extends AutoDisposeAsyncNotifierProviderImpl<OtherRiverpodForTheCombiningProviders, int> {
  /// See also [OtherRiverpodForTheCombiningProviders].
  OtherRiverpodForTheCombiningProvidersProvider(int duration)
    : this._internal(
        () => OtherRiverpodForTheCombiningProviders()..duration = duration,
        from: otherRiverpodForTheCombiningProvidersProvider,
        name: r'otherRiverpodForTheCombiningProvidersProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$otherRiverpodForTheCombiningProvidersHash,
        dependencies: OtherRiverpodForTheCombiningProvidersFamily._dependencies,
        allTransitiveDependencies:
            OtherRiverpodForTheCombiningProvidersFamily._allTransitiveDependencies,
        duration: duration,
      );

  OtherRiverpodForTheCombiningProvidersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.duration,
  }) : super.internal();

  final int duration;

  @override
  FutureOr<int> runNotifierBuild(covariant OtherRiverpodForTheCombiningProviders notifier) {
    return notifier.build(duration);
  }

  @override
  Override overrideWith(OtherRiverpodForTheCombiningProviders Function() create) {
    return ProviderOverride(
      origin: this,
      override: OtherRiverpodForTheCombiningProvidersProvider._internal(
        () => create()..duration = duration,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        duration: duration,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<OtherRiverpodForTheCombiningProviders, int>
  createElement() {
    return _OtherRiverpodForTheCombiningProvidersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OtherRiverpodForTheCombiningProvidersProvider && other.duration == duration;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, duration.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OtherRiverpodForTheCombiningProvidersRef on AutoDisposeAsyncNotifierProviderRef<int> {
  /// The parameter `duration` of this provider.
  int get duration;
}

class _OtherRiverpodForTheCombiningProvidersProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<OtherRiverpodForTheCombiningProviders, int>
    with OtherRiverpodForTheCombiningProvidersRef {
  _OtherRiverpodForTheCombiningProvidersProviderElement(super.provider);

  @override
  int get duration => (origin as OtherRiverpodForTheCombiningProvidersProvider).duration;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
