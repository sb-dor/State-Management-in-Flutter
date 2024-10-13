import 'package:flutter/foundation.dart';
import 'package:state_management_course/inherited_widget/todo_with_inherited_notifier/models/td_inhnot_model.dart';
import 'state_model/td_inhnot_state_model.dart';

class TdInhViewModel extends ChangeNotifier {
  final TdInhNotStateModel todoListMVVMStateModel = TdInhNotStateModel();

  Future<void> initTodos() async {
    debugPrint("initing todos");
    todoListMVVMStateModel.setLoading(true);
    notifyListeners();
    await todoListMVVMStateModel.initTodos();
    todoListMVVMStateModel.setLoading(false);
    debugPrint("initing todos");
    notifyListeners();
  }

  void addTodo(String todo) {
    todoListMVVMStateModel.addTodo(todo);
    notifyListeners();
  }

  void removeTodo(TdInhNotModel todo) {
    todoListMVVMStateModel.removeTodo(todo);
    notifyListeners();
  }
}
