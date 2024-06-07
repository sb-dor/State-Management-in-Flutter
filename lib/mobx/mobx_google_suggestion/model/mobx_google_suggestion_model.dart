import 'package:uuid/uuid.dart';

class MobxGoogleSuggestionModel {
  final String name;
  final String uuid;

  MobxGoogleSuggestionModel({required this.name}) : uuid = const Uuid().v4();
}
