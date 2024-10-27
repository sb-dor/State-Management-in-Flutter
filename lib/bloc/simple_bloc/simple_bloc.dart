// data class
import 'dart:async';

class SimpleUser {
  final String? name;
  final int? age;

  const SimpleUser({
    this.name,
    this.age,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SimpleUser &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age);

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() {
    return 'SimpleUser{' + ' name: $name,' + ' age: $age,' + '}';
  }

  SimpleUser copyWith({
    String? name,
    int? age,
  }) {
    return SimpleUser(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory SimpleUser.fromMap(Map<String, dynamic> map) {
    return SimpleUser(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }
}

class SimpleBlocState {
  final SimpleUser user;

  const SimpleBlocState({
    required this.user,
  });

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

  SimpleBlocState copyWith({
    SimpleUser? user,
  }) {
    return SimpleBlocState(
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
    };
  }

  factory SimpleBlocState.fromMap(Map<String, dynamic> map) {
    return SimpleBlocState(
      user: map['user'] as SimpleUser,
    );
  }
}

class SimpleBloc {
  late SimpleBlocState _state;

  SimpleBlocState get initialState => _state;

  final _stateController = StreamController<SimpleBlocState>.broadcast();

  Stream<SimpleBlocState> get stateStream => _stateController.stream;

  SimpleBloc() {
    _init();
  }

  void _init() {
    _state = const SimpleBlocState(
      user: SimpleUser(name: "avaz", age: 22),
    );
    _stateController.add(_state);
  }

  void _updateState(SimpleBlocState state) {
    if (_state == state) return;
    _state = state;
    _stateController.add(_state);
  }

  void incrementAge() {
    var user = _state.user;
    user = user.copyWith(age: user.age! + 1);
    _updateState(_state.copyWith(user: user));
  }

  void decrementAge() {
    var user = _state.user;
    user = user.copyWith(age: user.age! - 1);
    _updateState(_state.copyWith(user: user));
  }
}
