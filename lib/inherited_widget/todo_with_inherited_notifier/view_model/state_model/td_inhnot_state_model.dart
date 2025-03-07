import 'dart:collection';

import 'package:state_management_course/inherited_widget/todo_with_inherited_notifier/models/td_inhnot_model.dart';
import 'package:state_management_course/inherited_widget/todo_with_inherited_notifier/repository/td_inhnot_repository.dart';

class TdInhNotStateModel {
  final TdInhNotRepository _todoMVVMService = TdInhNotRepository();

  final List<TdInhNotModel> _todoMVVM = [];

  bool _loading = false;

  bool get loading => _loading;

  UnmodifiableListView<TdInhNotModel> get todoMVVM =>
      UnmodifiableListView(_todoMVVM);

  void _clearAllTodos() => _todoMVVM.clear();

  void _addTodos(List<TdInhNotModel> todos) => _todoMVVM.addAll(todos);

  bool setLoading(bool value) => _loading = value;

  Future<void> initTodos() async {
    _clearAllTodos();
    await Future.delayed(const Duration(seconds: 3));
    _addTodos(await _todoMVVMService.getTodos());
  }

  void addTodo(String todo) {
    _todoMVVM.add(TdInhNotModel(todo: todo));
  }

  void removeTodo(TdInhNotModel todo) {
    _todoMVVM.removeWhere((eachTodo) => eachTodo.id == todo.id);
  }
}
