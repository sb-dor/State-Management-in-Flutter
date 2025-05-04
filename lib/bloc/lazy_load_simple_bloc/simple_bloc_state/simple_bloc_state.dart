import 'package:state_management_course/bloc/lazy_load_simple_bloc/models/simple_user.dart';

class SimpleBlocState {
  final SimpleUser user;

  const SimpleBlocState({required this.user});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SimpleBlocState && runtimeType == other.runtimeType && user == other.user);

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() {
    return 'SimpleBlocState{ user: $user}';
  }

  SimpleBlocState copyWith({SimpleUser? user}) {
    return SimpleBlocState(user: user ?? this.user);
  }

  Map<String, dynamic> toMap() {
    return {'user': user};
  }

  factory SimpleBlocState.fromMap(Map<String, dynamic> map) {
    return SimpleBlocState(user: map['user'] as SimpleUser);
  }
}
