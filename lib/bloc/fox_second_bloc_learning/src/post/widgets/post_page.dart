import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/bloc/authentication_bloc.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/bloc/authentication_events.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/bloc/authentication_states.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/widget/authentication_widget.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/bloc/post_bloc.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/bloc/post_state.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/widgets/post_creation_widget.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/widgets/post_widget.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _State();
}

class _State extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post page"),
        actions: [
          BlocConsumer<AuthenticationBloc, AuthenticationStates>(
            listener: (context, state) {
              if (state is UnAuthenticated) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AuthenticationWidget();
                    },
                  ),
                  (predicate) => false,
                );
              }
            },
            builder: (context, state) {
              if (state is InProgressAuthenticationState) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 20,
                  height: 20,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                );
              } else {
                return IconButton(
                  onPressed: () {
                    // or like this
                    context.read<AuthenticationBloc>().add(const LogOutAuthenticationEvent());
                  },
                  icon: const Icon(Icons.logout),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PostCreationWidget()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          final stateModel = state.postStateModel;
          return ListView.builder(
            itemCount: stateModel.posts.length,
            itemBuilder: (context, index) {
              final post = stateModel.posts[index];
              return PostWidget(post: post);
            },
          );
        },
      ),
    );
  }
}
