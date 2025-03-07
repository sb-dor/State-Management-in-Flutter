import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'mobx_todo_model.g.dart';

class MobxTodoModel = _MobxTodoModelAbstraction with _$MobxTodoModel;

abstract class _MobxTodoModelAbstraction with Store {
  final String description;
  final String uuid;

  @observable
  bool deleted;

  _MobxTodoModelAbstraction({required this.description})
    : uuid = const Uuid().v4(),
      deleted = false;
}
