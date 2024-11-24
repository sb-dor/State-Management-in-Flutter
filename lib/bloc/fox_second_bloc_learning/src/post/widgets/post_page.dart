import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/bloc/authentication_bloc.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/bloc/authentication_events.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/bloc/authentication_states.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/widget/authentication_widget.dart';

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
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
