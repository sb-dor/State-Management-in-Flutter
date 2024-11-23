import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/models/user_entity.dart';
import 'package:uuid/uuid.dart';

abstract interface class IAuthenticationDatasource {
  Future<AuthenticatedUser?> login({
    required final String email,
    required final String password,
  });

  Future<bool> logout();

  Future<AuthenticatedUser?> checkAuth();
}

class AuthenticationDatasourceImpl implements IAuthenticationDatasource {
  @override
  Future<AuthenticatedUser?> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 3));
    return AuthenticatedUser(
      uid: const Uuid().v4(),
      displayName: "Name",
      photoURL: "Any url",
      email: email,
    );
  }

  @override
  Future<bool> logout() async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }

  @override
  Future<AuthenticatedUser?> checkAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    return null;
  }
}
