import 'package:state_management_course/bloc/fox_second_bloc_learning/authentication/models/user_entity.dart';

abstract interface class IAuthenticationRepository {
  Future<AuthenticatedUser?> login({
    required final String email,
    required final String password,
  });

  Future<void> logout();
}
