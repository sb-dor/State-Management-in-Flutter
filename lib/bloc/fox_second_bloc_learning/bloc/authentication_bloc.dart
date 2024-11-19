import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/data/authentication_repository.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/models/user_entity.dart';
import 'authentication_events.dart';
import 'authentication_states.dart';

class AuthenticationBloc extends Bloc<AuthenticationBlocEvents, AuthenticationStates> {
  final IAuthenticationRepository _repository;

  // I didn't know that we can inject deps like this
  // that is why I did so:
  AuthenticationBloc({
    required final IAuthenticationRepository repository,
    UserEntity? user, // you can not pass user like this
  })  : _repository = repository,
        super(
          user?.when(
                // this when is using from UserEntity.dart (from models folder)
                authenticated: (user) => AuthenticationStates.authenticated(user),
                notAuthenticated: () => const AuthenticationStates.inProgress(),
              ) ??
              const AuthenticationStates.inProgress(), // by default
        ) {
    //
    // event handlers
    on<AuthenticationBlocEvents>(
      (event, emit) => event.map(
        logIn: (loginEvent) => _login(loginEvent, emit),
        logOut: (logoutEvent) => _logout(logoutEvent, emit),
      ),
      transformer: droppable(),
    );
  }

  void _login(
    LogInAuthenticationEvent event,
    Emitter<AuthenticationStates> emit,
  ) async {
    try {
      emit(AuthenticationStates.inProgress(user: state.user));
      //

      final user = await _repository.login(email: event.email, password: event.password);

      if (user != null) {
        emit(AuthenticationStates.authenticated(user)); // new user
      } else {
        emit(const AuthenticationStates.unAuthenticated());
      }
    } on Object catch (error, stackTrace) {
      emit(AuthenticationStates.error(user: state.user));
      rethrow;
    } finally {
      //
    }
  }

  void _logout(
    LogOutAuthenticationEvent logout,
    Emitter<AuthenticationStates> emit,
  ) async {
    try {
      emit(AuthenticationStates.inProgress(user: state.user));

      await _repository.logout();

      emit(const AuthenticationStates.unAuthenticated(user: UserEntity.notAuthenticated()));
      //
    } on Object catch (error, stackTrace) {
      emit(AuthenticationStates.error(user: state.user));
      rethrow;
    } finally {
      //
    }
  }
}
