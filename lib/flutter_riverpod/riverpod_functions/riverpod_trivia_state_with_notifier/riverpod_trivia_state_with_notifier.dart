import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management_course/flutter_riverpod/riverpod_functions/riverpod_number_trivia_model.dart';
import 'package:http/http.dart' as http;
import 'package:state_management_course/main.dart';

part 'riverpod_trivia_state_with_notifier.g.dart';

//  All providers must be annotated with @riverpod or @Riverpod().
//  This annotation can be placed on global functions or classes.
//  Through this annotation, it is possible to configure the provider.

//  When a @riverpod annotation is placed on a class, that class is called a "Notifier".
//  The class must extend _$NotifierName, where NotifierName is the class name.
//
//  Notifiers are responsible for exposing ways to modify the state of the provider.
@riverpod
class RiverpodTriviaStateWithNotifier extends _$RiverpodTriviaStateWithNotifier {
  @override
  Future<List<RiverpodNumberTriviaModel>> build() async {
    final headers = {'Content-Type': 'application/json'};
    final List<RiverpodNumberTriviaModel> data = [];
    for (int i = 0; i < 10; i++) {
      final response = await http.get(
        Uri.parse("http://numbersapi.com/random?json"),
        headers: headers,
      );
      data.add(RiverpodNumberTriviaModel.fromJson(jsonDecode(response.body)));
    }
    return data;
  }

  void showEdit(RiverpodNumberTriviaModel model) {
    final data = state.whenData((data) {
      final findModel = data.indexWhere((e) => e.id == model.id);
      if (findModel != -1) {
        data[findModel].edit = true;
      }
      return data;
    });
    state = data;
  }

  void saveTriviaText(RiverpodNumberTriviaModel model) {
    final data = state.whenData((data) {
      final findModel = data.indexWhere((e) => e.id == model.id);
      if (findModel != -1) {
        data[findModel].text = model.textEditingController.text.trim();
        data[findModel].edit = false;
      }
      return data;
    });
    state = data;
  }
}
