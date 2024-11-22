import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/models/user_entity.dart';
part 'authentication_states.freezed.dart';

@freezed
sealed class AuthenticationStates with _$AuthenticationStates {
  // map comes from inside
  UserEntity? get authenticatedUser => maybeMap(
        authenticated: (state) => state.user,
        inProgress: (state) => state.user,
        orElse: () => null,
      );

  // checks only your preferred state and returns anything that related to return function
  // other functions will not be considered and you can return anything you want
  bool get isInProgress => maybeMap(orElse: () => false, inProgress: (_) => true);

  const AuthenticationStates._();

  const factory AuthenticationStates.authenticated(UserEntity user) = InitialAuthenticationState;

  const factory AuthenticationStates.inProgress({
    @Default(UserEntity.notAuthenticated()) UserEntity user,
  }) = InProgressAuthenticationState;

  const factory AuthenticationStates.unAuthenticated({
    @Default(UserEntity.notAuthenticated()) UserEntity user,
  }) = UnErrorAuthenticationError;

  const factory AuthenticationStates.error({
    @Default(UserEntity.notAuthenticated()) UserEntity user,
    String? message,
  }) = ErrorAuthenticatedState;
}
