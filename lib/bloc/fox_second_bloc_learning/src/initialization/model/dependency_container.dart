import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/bloc/authentication_bloc.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/bloc/post_bloc.dart';

class DependencyContainer {
  final AuthenticationBloc authenticationBloc;

  final PostBloc postBloc;

  DependencyContainer({required this.authenticationBloc, required this.postBloc});
}
