import 'package:faker/faker.dart';
import 'package:state_management_course/inherited_widget/todo_with_inherited_notifier/models/td_inhnot_model.dart';

class TdInhNotService {
  Future<List<TdInhNotModel>> getTodos() async {
    final faker = Faker();
    return List.generate(30, (index) => TdInhNotModel(todo: faker.lorem.sentence()));
  }
}
