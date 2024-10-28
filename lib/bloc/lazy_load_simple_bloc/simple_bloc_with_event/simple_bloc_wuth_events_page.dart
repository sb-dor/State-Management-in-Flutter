import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:state_management_course/bloc/lazy_load_simple_bloc/simple_bloc_with_event/simple_bloc_with_event.dart';

class SimpleBlocWithEventsPage extends StatefulWidget {
  const SimpleBlocWithEventsPage({super.key});

  @override
  State<SimpleBlocWithEventsPage> createState() => _SimpleBlocWithEventsPageState();
}

class _SimpleBlocWithEventsPageState extends State<SimpleBlocWithEventsPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider<SimpleBlocWithEvent>(create: (_) => SimpleBlocWithEvent()),
      ],
      child: const MaterialApp(
        home: _SimpleBlocPageUI(),
      ),
    );
  }
}

class _SimpleBlocPageUI extends StatefulWidget {
  const _SimpleBlocPageUI();

  @override
  State<_SimpleBlocPageUI> createState() => _SimpleBlocPageUIState();
}

class _SimpleBlocPageUIState extends State<_SimpleBlocPageUI> {
  @override
  Widget build(BuildContext context) {
    final simpleBloc = context.read<SimpleBlocWithEvent>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple bloc"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const _AnotherPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_right_alt,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        initialData: simpleBloc.state,
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
                  simpleBloc.addEvent(SimpleBlocIncrementEvent());
                },
                child: const Text("Increment"),
              ),
              Text("${state.user.age}"),
              TextButton(
                onPressed: () {
                  simpleBloc.addEvent(SimpleBlocDecrementEvent());
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
    final simpleBloc = context.read<SimpleBlocWithEvent>();
    return StreamBuilder(
      initialData: simpleBloc.state,
      stream: simpleBloc.stateStream,
      builder: (context, snap) {
        return Scaffold(
          appBar: AppBar(
            title: Text("${snap.requireData.user.age}"),
            actions: [
              IconButton(
                onPressed: () {
                  simpleBloc.addEvent(SimpleBlocDecrementEvent());
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
