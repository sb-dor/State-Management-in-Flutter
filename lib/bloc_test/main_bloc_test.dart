import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_course/bloc_test/bloc_event_states.dart';
import 'package:state_management_course/bloc_test/bloc_event_test.dart';

class MainBlocTest extends Bloc<BlocEventTest, BlocEventStates> {
  MainBlocTest() : super(LoadingBlocTestState()) {
    //
    on<LoadEvent>(
      (event, emit) {
        emit(LoadingBlocTestState());
      },
    );

    //
  }
}
