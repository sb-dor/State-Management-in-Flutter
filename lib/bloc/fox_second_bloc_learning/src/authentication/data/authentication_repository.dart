import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/data/authentication_datasouce.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/models/user_entity.dart';

abstract interface class IAuthenticationRepository {
  Future<AuthenticatedUser?> login({required final String email, required final String password});

  Future<bool> logout();

  Future<AuthenticatedUser?> checkAuth();
}

final class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  final IAuthenticationDatasource _authenticationDatasource;

  AuthenticationRepositoryImpl(this._authenticationDatasource);

  @override
  Future<AuthenticatedUser?> login({required String email, required String password}) =>
      _authenticationDatasource.login(email: email, password: password);

  @override
  Future<bool> logout() => _authenticationDatasource.logout();

  @override
  Future<AuthenticatedUser?> checkAuth() => _authenticationDatasource.checkAuth();
}
