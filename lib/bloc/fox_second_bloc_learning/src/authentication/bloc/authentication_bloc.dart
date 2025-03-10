import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/data/authentication_repository.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/models/user_entity.dart';
import 'authentication_events.dart';
import 'authentication_states.dart';

class AuthenticationBloc extends Bloc<AuthenticationBlocEvents, AuthenticationStates> {
  final IAuthenticationRepository _repository;

  // I didn't know that we can inject deps like this
  // that is why I did so:
  AuthenticationBloc({
    required final IAuthenticationRepository repository,
    UserEntity? user, // you can not pass user like this
  }) : _repository = repository,
       super(
         user?.when(
               // is using from UserEntity.dart (from models folder)
               authenticated: (user) => AuthenticationStates.authenticated(user),
               notAuthenticated: () => const AuthenticationStates.inProgress(),
             ) ??
             const AuthenticationStates.inProgress(), // by default
       ) {
    //
    //
    // EventTransformer<T> isolateAndSequential<T>() {
    //   return (events, mapper) {
    //     // Group events by type (class) to isolate handling of different event types.
    //     final eventStreams = events.groupBy((event) => event.runtimeType);
    //
    //     // Process each grouped stream sequentially.
    //     return eventStreams.flatMap((groupedStream) {
    //       return groupedStream.sequential().flatMap(mapper);
    //     });
    //   };
    // }
    //
    // event handlers
    // NOTE!
    // if you want to use transformers with freezed
    // the best solution for transformer is "concurrent()"
    // but you have to created getters for each state (optional, one is enough)
    // in order to check whether specific state is working and you can not to emit particular
    // state again while it's in precess (you can call other events at that time)

    // EDITED!
    // after learning specific articles from Fox and Michael Lazebny, I want to change opinion about
    // using "concurrent" transformer, it's better to use only one "on" handler with "sequential"
    // transformer, because every event inside "on" handler will be executed only after one of the finishes
    //
    on<AuthenticationBlocEvents>(
      /// NOTE! when you want to create events with freezed
      /// register all events like I'm doing below
      /// especially:  [(event, emit) => event.map]
      (event, emit) => event.map(
        logIn: (loginEvent) => _login(loginEvent, emit),
        logOut: (logoutEvent) => _logout(logoutEvent, emit),
        checkAuth: (checkAuthEvent) => _checkAuthEvent(checkAuthEvent, emit),
      ),
      transformer: concurrent(),
    );
  }

  void _login(LogInAuthenticationEvent event, Emitter<AuthenticationStates> emit) async {
    try {
      if (state.isInProgress) return;

      emit(AuthenticationStates.inProgress(user: state.user));
      //
      debugPrint("checking login");

      final user = await _repository.login(email: event.email, password: event.password);

      if (user != null) {
        emit(AuthenticationStates.authenticated(user)); // new user
      } else {
        emit(const AuthenticationStates.unAuthenticated());
      }
    } on Object {
      emit(AuthenticationStates.error(user: state.user));
      rethrow;
    } finally {
      //
    }
  }

  void _logout(LogOutAuthenticationEvent logout, Emitter<AuthenticationStates> emit) async {
    try {
      emit(AuthenticationStates.inProgress(user: state.user));

      debugPrint("checking logout");

      await _repository.logout();

      emit(const AuthenticationStates.unAuthenticated(user: UserEntity.notAuthenticated()));
      //
    } on Object {
      emit(AuthenticationStates.error(user: state.user));
      rethrow;
    } finally {
      //
    }
  }

  void _checkAuthEvent(CheckAuthenticationEvent logout, Emitter<AuthenticationStates> emit) async {
    try {
      emit(AuthenticationStates.inProgress(user: state.user));

      debugPrint("checking auth");
      // await _repository.logout();
      final checkAuth = await _repository.checkAuth();

      if (checkAuth != null) {
        emit(AuthenticationStates.authenticated(checkAuth));
      } else {
        emit(const AuthenticationStates.unAuthenticated(user: UserEntity.notAuthenticated()));
      }
      //
    } on Object {
      emit(AuthenticationStates.error(user: state.user));
      rethrow;
    } finally {
      //
    }
  }
}
