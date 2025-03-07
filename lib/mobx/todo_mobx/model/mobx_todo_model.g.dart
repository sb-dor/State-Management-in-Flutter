// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_todo_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxTodoModel on _MobxTodoModelAbstraction, Store {
  late final _$deletedAtom = Atom(
    name: '_MobxTodoModelAbstraction.deleted',
    context: context,
  );

  @override
  bool get deleted {
    _$deletedAtom.reportRead();
    return super.deleted;
  }

  @override
  set deleted(bool value) {
    _$deletedAtom.reportWrite(value, super.deleted, () {
      super.deleted = value;
    });
  }

  @override
  String toString() {
    return '''
deleted: ${deleted}
    ''';
  }
}
