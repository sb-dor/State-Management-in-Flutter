import 'package:uuid/uuid.dart';

class TdInhNotModel {
  final String id;
  final String todo;

  TdInhNotModel({required this.todo}) : id = const Uuid().v4();
}
