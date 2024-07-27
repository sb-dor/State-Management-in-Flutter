import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:state_management_course/flutter_riverpod/riverpod_functions/riverpod_number_trivia_model.dart';

part 'riverpod_function_state.g.dart';

//  All providers must be annotated with @riverpod or @Riverpod().
//  This annotation can be placed on global functions or classes.
//  Through this annotation, it is possible to configure the provider.

//  When a @riverpod annotation is placed on a class, that class is called a "Notifier".
//  The class must extend _$NotifierName, where NotifierName is the class name.
//
//  Notifiers are responsible for exposing ways to modify the state of the provider.
@riverpod
Future<RiverpodNumberTriviaModel> trivia(TriviaRef ref) async {
  final headers = {'Content-Type': 'application/json'};
  final response = await http.get(
    Uri.parse("http://numbersapi.com/random?json"),
    headers: headers,
  );
  return RiverpodNumberTriviaModel.fromJson(jsonDecode(response.body));
}

@riverpod
Future<List<RiverpodNumberTriviaModel>> trivias(TriviasRef ref) async {
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
