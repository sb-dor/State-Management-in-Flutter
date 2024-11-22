import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/models/user_entity.dart';

abstract interface class IAuthenticationRepository {
  Future<AuthenticatedUser?> login({
    required final String email,
    required final String password,
  });

  Future<void> logout();
}

final class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  @override
  Future<AuthenticatedUser?> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}