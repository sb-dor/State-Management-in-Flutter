
// data class
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
    return 'SimpleUser{ name: $name, age: $age,}';
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