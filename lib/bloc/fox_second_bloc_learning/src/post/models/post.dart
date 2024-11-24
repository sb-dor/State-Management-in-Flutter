import 'package:uuid/uuid.dart';

class Post {
  final String id;
  final String title;
  final String content;
  final DateTime datetime;
  final String author;

  Post({
    required this.title,
    required this.content,
    required this.author,
  })  : id = const Uuid().v4(),
        datetime = DateTime.now();
}
