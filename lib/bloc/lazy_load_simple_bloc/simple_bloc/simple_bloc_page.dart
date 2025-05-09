import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'simple_bloc.dart';

class SimpleBlocPage extends StatefulWidget {
  const SimpleBlocPage({super.key});

  @override
  State<SimpleBlocPage> createState() => _SimpleBlocPageState();
}

class _SimpleBlocPageState extends State<SimpleBlocPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [Provider(create: (_) => SimpleBloc())],
      child: const MaterialApp(home: SimpleBlocPageUI()),
    );
  }
}

class SimpleBlocPageUI extends StatefulWidget {
  const SimpleBlocPageUI({super.key});

  @override
  State<SimpleBlocPageUI> createState() => _SimpleBlocPageUIState();
}

class _SimpleBlocPageUIState extends State<SimpleBlocPageUI> {
  @override
  Widget build(BuildContext context) {
    final simpleBloc = context.read<SimpleBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple bloc"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const _AnotherPage()),
              );
            },
            icon: const Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
      body: StreamBuilder(
        initialData: simpleBloc.initialState,
        stream: simpleBloc.stateStream,
        builder: (context, snapshot) {
          // switch (snapshot.connectionState) {
          //   case ConnectionState.none:
          //   case ConnectionState.waiting:
          //     return const CircularProgressIndicator();
          //   case ConnectionState.active:
          //   case ConnectionState.done:
          final state = snapshot.requireData;
          return Column(
            children: [
              TextButton(
                onPressed: () {
                  simpleBloc.incrementAge();
                },
                child: const Text("Increment"),
              ),
              Text("${state.user.age}"),
              TextButton(
                onPressed: () {
                  simpleBloc.decrementAge();
                },
                child: const Text("Increment"),
              ),
            ],
          );
          // }
        },
      ),
    );
  }
}

class _AnotherPage extends StatelessWidget {
  const _AnotherPage();

  @override
  Widget build(BuildContext context) {
    final simpleBloc = context.read<SimpleBloc>();
    return StreamBuilder(
      initialData: simpleBloc.initialState,
      stream: simpleBloc.stateStream,
      builder: (context, snap) {
        return Scaffold(
          appBar: AppBar(
            title: Text("${snap.requireData.user.age}"),
            actions: [
              IconButton(
                onPressed: () {
                  simpleBloc.decrementAge();
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
            ],
          ),
        );
      },
    );
  }
}
