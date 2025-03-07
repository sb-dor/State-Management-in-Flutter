import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management_course/flutter_riverpod/riverpod_number_trivia/riverpod_number_trivia_model.dart';
import 'package:state_management_course/flutter_riverpod/riverpod_with_state/riverpod_with_state/state_model/riverpod_with_state_model.dart';
import 'package:http/http.dart' as http;

part 'riverpod_state_helper.g.dart';

@riverpod
class RiverpodStateHelper extends _$RiverpodStateHelper {
  @override
  RiverpodWithStateModel build() {
    return RiverpodWithStateModel();
  }

  void fetchData() async {
    final headers = {'Content-Type': 'application/json'};
    final List<RiverpodNumberTriviaModel> data = [];
    for (int i = 0; i < 5; i++) {
      final response = await http.get(
        Uri.parse("http://numbersapi.com/random?json"),
        headers: headers,
      );
      data.add(RiverpodNumberTriviaModel.fromJson(jsonDecode(response.body)));
    }
    state = state.clone(numberTrivias: data);
  }

  void showEdit(RiverpodNumberTriviaModel model) {
    final stateClones = state.clone();
    final findModel = stateClones.numberTrivias?.indexWhere(
      (e) => e.id == model.id,
    );
    if (findModel != -1 && findModel != null) {
      stateClones.numberTrivias?[findModel].edit = true;
    }
    state = stateClones;
  }

  void saveTriviaText(RiverpodNumberTriviaModel model) {
    final stateClones = state.clone();
    final findModel = stateClones.numberTrivias?.indexWhere(
      (e) => e.id == model.id,
    );
    if (findModel != -1 && findModel != null) {
      stateClones.numberTrivias?[findModel].text =
          model.textEditingController.text.trim();
      stateClones.numberTrivias?[findModel].edit = false;
    }
    state = stateClones;
  }
}
