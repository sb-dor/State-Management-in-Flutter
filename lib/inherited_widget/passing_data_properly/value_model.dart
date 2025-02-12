final class ValueModel {
  final int counter;

  const ValueModel({
    required this.counter,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ValueModel && runtimeType == other.runtimeType && counter == other.counter);

  @override
  int get hashCode => counter.hashCode;

  @override
  String toString() {
    return 'ValueModel{' + ' counter: $counter,' + '}';
  }

  ValueModel copyWith({
    int? counter,
  }) {
    return ValueModel(
      counter: counter ?? this.counter,
    );
  }


}