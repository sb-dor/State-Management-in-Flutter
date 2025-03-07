
import 'package:state_management_course/flutter_riverpod/riverpod_number_trivia/riverpod_number_trivia_model.dart';

class RiverpodWithStateModel {
  RiverpodWithStateModel clone({
    List<RiverpodNumberTriviaModel>? numberTrivias,
  }) => RiverpodWithStateModel(
    numberTrivias: numberTrivias ?? this.numberTrivias,
  );

  RiverpodWithStateModel({this.numberTrivias});

  List<RiverpodNumberTriviaModel>? numberTrivias = [];

  void addToTrivias(List<RiverpodNumberTriviaModel> data) {
    numberTrivias?.clear();
    numberTrivias?.addAll(data);
  }
}
