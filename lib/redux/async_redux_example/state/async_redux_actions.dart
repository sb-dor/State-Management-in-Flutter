import 'package:flutter/foundation.dart';
import 'package:state_management_course/redux/async_redux_example/models/person.dart';

@immutable
abstract class AsyncReduxActions {
  const AsyncReduxActions();
}

@immutable
class LoadPeopleAction extends AsyncReduxActions {
  const LoadPeopleAction();
}

@immutable
class SuccessfullyFetchedPeopleAction extends AsyncReduxActions {
  final Iterable<Person> persons;

  const SuccessfullyFetchedPeopleAction({required this.persons});
}

@immutable
class FailedFetchedPeople extends AsyncReduxActions {
  final Object? error;

  const FailedFetchedPeople({required this.error});
}
