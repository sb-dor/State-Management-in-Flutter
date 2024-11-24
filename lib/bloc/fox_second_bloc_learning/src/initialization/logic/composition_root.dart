import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/bloc/authentication_bloc.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/data/authentication_datasouce.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/data/authentication_repository.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/initialization/model/dependency_container.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/bloc/post_bloc.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/bloc/post_state.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/data/post_datasource.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/data/post_repository.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/models/post.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/models/post_state_model.dart';

// the main reason and the main concept of doing so
// is that we want to achieve injections without getIt pattern (Service locator, which is good for service location)
final class CompositionRoot {
  Future<CompositionResult> composeResult() async {
    final dependencyContainerFactory = DependencyFactory().create();

    return CompositionResult(dependencyContainerFactory);
  }
}

final class CompositionResult {
  final DependencyContainer dependencyContainer;

  CompositionResult(this.dependencyContainer);
}

class DependencyFactory extends Factory<DependencyContainer> {
  @override
  DependencyContainer create() {
    // you can create another class that creates
    // authentication bloc with all necessary dependencies
    final IAuthenticationDatasource authenticationDatasource = AuthenticationDatasourceImpl();
    final IAuthenticationRepository authenticationRepository =
        AuthenticationRepositoryImpl(authenticationDatasource);
    final AuthenticationBloc authenticationBloc = AuthenticationBloc(
      repository: authenticationRepository,
    );

    //
    final IPostDatasource postDatasource = PostDatasourceImpl();
    final IPostRepository postRepository = PostRepositoryImpl(postDatasource);
    const PostState initialState = PostState.initial(
      PostStateModel(
        posts: <Post>[],
      ),
    );

    final postBloc = PostBloc(
      postRepository: postRepository,
      initialState: initialState,
    );

    return DependencyContainer(
      authenticationBloc: authenticationBloc,
      postBloc: postBloc,
    );
  }
}

abstract class Factory<T> {
  T create();
}

abstract class AsyncFactory<T> {
  Future<T> create();
}
