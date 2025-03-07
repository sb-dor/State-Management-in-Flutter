// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_mobx_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoMobxStoreObservable on _TodoMobxStore, Store {
  Computed<ObservableList<MobxTodoModel>>? _$visibleTypeComputed;

  @override
  ObservableList<MobxTodoModel> get visibleType =>
      (_$visibleTypeComputed ??= Computed<ObservableList<MobxTodoModel>>(
            () => super.visibleType,
            name: '_TodoMobxStore.visibleType',
          ))
          .value;

  late final _$todosAtom = Atom(name: '_TodoMobxStore.todos', context: context);

  @override
  ObservableList<MobxTodoModel> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<MobxTodoModel> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$showTypeOfTodosAtom = Atom(name: '_TodoMobxStore.showTypeOfTodos', context: context);

  @override
  ShowTypeOfTodos get showTypeOfTodos {
    _$showTypeOfTodosAtom.reportRead();
    return super.showTypeOfTodos;
  }

  @override
  set showTypeOfTodos(ShowTypeOfTodos value) {
    _$showTypeOfTodosAtom.reportWrite(value, super.showTypeOfTodos, () {
      super.showTypeOfTodos = value;
    });
  }

  late final _$_TodoMobxStoreActionController = ActionController(
    name: '_TodoMobxStore',
    context: context,
  );

  @override
  void showType(ShowTypeOfTodos type) {
    final _$actionInfo = _$_TodoMobxStoreActionController.startAction(
      name: '_TodoMobxStore.showType',
    );
    try {
      return super.showType(type);
    } finally {
      _$_TodoMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo(String description) {
    final _$actionInfo = _$_TodoMobxStoreActionController.startAction(
      name: '_TodoMobxStore.addTodo',
    );
    try {
      return super.addTodo(description);
    } finally {
      _$_TodoMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(MobxTodoModel model) {
    final _$actionInfo = _$_TodoMobxStoreActionController.startAction(
      name: '_TodoMobxStore.removeTodo',
    );
    try {
      return super.removeTodo(model);
    } finally {
      _$_TodoMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
showTypeOfTodos: ${showTypeOfTodos},
visibleType: ${visibleType}
    ''';
  }
}
