import 'package:state_management_course/inherited_widget/todo_with_inherited_notifier/models/td_inhnot_model.dart';
import 'package:state_management_course/inherited_widget/todo_with_inherited_notifier/repository/td_inhnot_service.dart';

class TdInhNotRepository {
  final TdInhNotService _todoMVVMService = TdInhNotService();

  Future<List<TdInhNotModel>> getTodos() => _todoMVVMService.getTodos();
}
