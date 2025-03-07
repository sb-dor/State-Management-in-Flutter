import 'package:state_management_course/socket_io_learning/models/user.dart';

final class Chat {
  final int id;
  final User user;

  Chat({required this.id, required this.user});
}

List<Chat> chats = [
  Chat(id: 1, user: User(id: 1, name: "Avaz")),
  Chat(id: 2, user: User(id: 2, name: "Dunya")),
  Chat(id: 3, user: User(id: 3, name: "Jahon")),
];
