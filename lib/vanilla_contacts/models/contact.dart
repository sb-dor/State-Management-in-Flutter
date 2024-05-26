import 'package:uuid/uuid.dart';

class Contact {
  final String id;
  final String name;

  // whenever you create new instance of this class - id will be placed with uuid automatically
  Contact({required this.name}) : id = const Uuid().v4();
}
