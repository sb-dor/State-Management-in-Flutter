import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/bloc/authentication_bloc.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/initialization/logic/composition_root.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/bloc/post_bloc.dart';

class MultiBlocProviderScope extends StatelessWidget {
  final Widget child;
  final CompositionResult compositionResult;

  const MultiBlocProviderScope({super.key, required this.child, required this.compositionResult});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (_) => compositionResult.dependencyContainer.authenticationBloc,
        ),
        BlocProvider<PostBloc>(create: (_) => compositionResult.dependencyContainer.postBloc),
      ],
      child: child,
    );
  }
}
