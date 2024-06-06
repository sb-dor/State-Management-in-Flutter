// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_with_streams_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxWithStreamsData on _MobxWithStreamsStore, Store {
  late final _$integerChangerStreamAtom = Atom(
      name: '_MobxWithStreamsStore.integerChangerStream', context: context);

  @override
  ObservableStream<int> get integerChangerStream {
    _$integerChangerStreamAtom.reportRead();
    return super.integerChangerStream;
  }

  @override
  set integerChangerStream(ObservableStream<int> value) {
    _$integerChangerStreamAtom.reportWrite(value, super.integerChangerStream,
        () {
      super.integerChangerStream = value;
    });
  }

  late final _$stopCountAsyncAction =
      AsyncAction('_MobxWithStreamsStore.stopCount', context: context);

  @override
  Future<void> stopCount() {
    return _$stopCountAsyncAction.run(() => super.stopCount());
  }

  late final _$_MobxWithStreamsStoreActionController =
      ActionController(name: '_MobxWithStreamsStore', context: context);

  @override
  void startCount() {
    final _$actionInfo = _$_MobxWithStreamsStoreActionController.startAction(
        name: '_MobxWithStreamsStore.startCount');
    try {
      return super.startCount();
    } finally {
      _$_MobxWithStreamsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
integerChangerStream: ${integerChangerStream}
    ''';
  }
}
