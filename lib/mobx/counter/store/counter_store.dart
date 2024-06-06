import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class Counter = _CounterStore with _$Counter;

abstract class _CounterStore with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
