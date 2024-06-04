import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:state_management_course/redux/async_redux_example/models/person.dart';
import 'package:state_management_course/redux/async_redux_example/state/async_redux_actions.dart';

@immutable
class AsyncReduxState {
  final bool isLoading;
  final Iterable<Person>? fetchedPersons;
  final Object? error;

  const AsyncReduxState({
    required this.isLoading,
    required this.fetchedPersons,
    required this.error,
  });

  const AsyncReduxState.empty()
      : isLoading = false,
        fetchedPersons = null,
        error = null;
}

AsyncReduxState asyncReduxReducer(AsyncReduxState oldState, action) {
  if (action is LoadPeopleAction) {
    return const AsyncReduxState(
      isLoading: true,
      fetchedPersons: null,
      error: null,
    );
  } else if (action is SuccessfullyFetchedPeopleAction) {
    return AsyncReduxState(
      isLoading: false,
      fetchedPersons: action.persons,
      error: null,
    );
  } else if (action is FailedFetchedPeople) {
    return AsyncReduxState(
      isLoading: false,
      fetchedPersons: oldState.fetchedPersons,
      error: action.error,
    );
  }
  return oldState;
}

// all Future functions that do something in the future
// should be placed inside "middlewares"
// and after calling Future function use specific action of Redux in order to place data
// ***
// ***
// all middlewares should be initialized inside main app's store
// ------ take a look a main.dart ------
void loadPeopleMiddleware(
  Store<AsyncReduxState> store,
  action,
  NextDispatcher next,
) {
  if (action is LoadPeopleAction) {
    getPersons()
        .then((persons) => store.dispatch(SuccessfullyFetchedPeopleAction(persons: persons)))
        .catchError((e) => store.dispatch(FailedFetchedPeople(error: e)));
  }
  next(action);
}
