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

  UnmodifiableListView<ModelWithoutCodeGeneration> get list => UnmodifiableListView(
        _list.where((e) => !e.deleted.value).toList(),
      );

  void addToList(String value) {
    runInAction(() {
      final model = ModelWithoutCodeGeneration(value);
      _list.add(model);
    });
  }

  void delete(ModelWithoutCodeGeneration model) {
    runInAction(() {
      final todo = _list.firstWhereOrNull((e) => e.id == model.id);
      if (todo == null) return;
      todo.deleted.value = true;
      _list[_list.indexWhere((e) => e.id == todo.id)] = todo;
    });
  }
}
