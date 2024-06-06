import 'package:uuid/uuid.dart';

class MobxTodoModel {
  final String description;
  final String uuid;
  bool deleted;

  MobxTodoModel({required this.description, this.deleted = false}) : uuid = const Uuid().v4();
}
