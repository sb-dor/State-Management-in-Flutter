import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management_course/bloc_test/bloc_event_states.dart';
import 'package:state_management_course/bloc_test/bloc_event_test.dart';
import 'package:state_management_course/bloc_test/main_bloc_test.dart';

void main() {
  group("Testing bloc", () {
    late MainBlocTest mainBlocTest;

    setUp(() {
      mainBlocTest = MainBlocTest();
    });

    //
    blocTest<MainBlocTest, BlocEventStates>("",
        build: () => mainBlocTest,
        verify: (bloc) =>
            bloc.state is LoadingBlocTestState // verify first state of bloc in order to continue
        );

    //

    blocTest<MainBlocTest, BlocEventStates>(
      "Mock retrieving persons from first iterable",
      build: () => mainBlocTest,
      act: (bloc) => bloc.add(LoadEvent()), // send events in order to expect something
      expect: () => [
        LoadingBlocTestState(),
      ],
    );

    // go and run -> Flutter test
  });
}
