import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:state_management_course/flutter_riverpod/riverpod_number_trivia/riverpod_number_trivia_model.dart';

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
    // We use "ref.watch" to obtain the latest passed seconds.
    // By specifying that ".future" after the provider, our code will wait
    // for at least one another seconds to be available.

    // Notice how we used ref.watch(otherRiverpodForTheCombiningProvidersProvider.future) instead of ref.watch(otherRiverpodForTheCombiningProvidersProvider).
    // That is because our provider is asynchronous. As such, we want to await for an initial value to be available.
    //
    // If we omit that .future, we would receive an AsyncValue, which is a snapshot of the current state of the provider.
    // But if no seconds is available yet, we won't be able to do anything.
    final value = await ref.watch(
      otherRiverpodForTheCombiningProvidersProvider(3).future,
    ); // when the value will be available

    debugPrint("second value comes: $value");

    final headers = {'Content-Type': 'application/json'};
    final List<RiverpodNumberTriviaModel> data = [];
    for (int i = 0; i < value; i++) {
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

@riverpod
class OtherRiverpodForTheCombiningProviders extends _$OtherRiverpodForTheCombiningProviders {
  @override
  Future<int> build(int duration) async {
    // just for test
    await Future.delayed(Duration(seconds: duration));
    return duration;
  }
}
