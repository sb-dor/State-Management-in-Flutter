import 'package:mobx/mobx.dart';

part 'mobx_with_streams_store.g.dart';

class MobxWithStreamsData = _MobxWithStreamsStore with _$MobxWithStreamsData;

abstract class _MobxWithStreamsStore with Store {
  @observable
  ObservableStream<int> integerChangerStream = ObservableStream(Stream.value(0));

  @action
  void startCount() {
    integerChangerStream = ObservableStream(Stream.periodic(const Duration(seconds: 1), (v) => v));
  }

  @action
  Future<void> stopCount() async {
    await integerChangerStream.close();
  }
}
