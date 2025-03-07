import 'package:uuid/uuid.dart';

class BaseDatetimeModel {
  final String id;
  final String lastUpdateAt;

  BaseDatetimeModel() : id = const Uuid().v4(), lastUpdateAt = DateTime.now().toIso8601String();

  @override
  bool operator ==(covariant BaseDatetimeModel other) => id == other.id;

  @override
  // TODO: implement hashCode
  int get hashCode => id.hashCode;
}
