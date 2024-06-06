import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';
import 'package:state_management_course/mobx/todo_mobx/model/mobx_todo_model.dart';

part 'todo_mobx_store.g.dart';

enum ShowTypeOfTodos { current, deleted }

class TodoMobxStoreObservable = _TodoMobxStore with _$TodoMobxStoreObservable;

abstract class _TodoMobxStore with Store {
  @observable
  ObservableList<MobxTodoModel> todos = ObservableList<MobxTodoModel>();

  @observable
  ShowTypeOfTodos showTypeOfTodos = ShowTypeOfTodos.current;

  @computed
  ObservableList<MobxTodoModel> get visibleType {
    switch (showTypeOfTodos) {
      case ShowTypeOfTodos.current:
        return ObservableList.of(todos.where((e) => !e.deleted).toList());
      case ShowTypeOfTodos.deleted:
        return ObservableList.of(todos.where((e) => e.deleted).toList());
    }
  }

  @action
  void showType(ShowTypeOfTodos type) => showTypeOfTodos = type;

  @action
  void addTodo(String description) {
    final todo = MobxTodoModel(description: description);
    todos.add(todo);
  }

  @action
  void removeTodo(MobxTodoModel model) {
    final todo = todos.firstWhereOrNull((e) => e.uuid == model.uuid);
    if (todo == null) return;
    todo.deleted = true;
    todos[todos.indexWhere((e) => e.uuid == todo.uuid)] = todo;
  }
}
