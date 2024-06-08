import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

class ModelWithoutCodeGeneration {
  final String id;
  final String desc;
  late final Observable<bool> deleted;

  ModelWithoutCodeGeneration(this.desc) : id = const Uuid().v4() {
    deleted = false.obs();
  }
}

class ModelWithoutCodeGenerationStore {
  final ObservableList<ModelWithoutCodeGeneration> _list =
      ObservableList<ModelWithoutCodeGeneration>();

  UnmodifiableListView<ModelWithoutCodeGeneration> get list => UnmodifiableListView(_list);

  void addToList(String value) {
    runInAction(() {
      final model = ModelWithoutCodeGeneration(value);
      _list.add(model);
    });
  }

  void delete(ModelWithoutCodeGeneration model) {
    runInAction(() {
      _list.removeWhere((e) => e.id == model.id);
    });
  }
}
