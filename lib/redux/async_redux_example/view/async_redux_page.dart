import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management_course/main.dart';
import 'package:state_management_course/redux/async_redux_example/models/person.dart';
import 'package:state_management_course/redux/async_redux_example/state/async_redux_actions.dart';
import 'package:state_management_course/redux/async_redux_example/state/async_redux_state.dart';

class AsyncReduxPage extends StatefulWidget {
  const AsyncReduxPage({super.key});

  @override
  State<AsyncReduxPage> createState() => _AsyncReduxPageState();
}

class _AsyncReduxPageState extends State<AsyncReduxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter Resux app"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              asyncState.dispatch(const LoadPeopleAction());
            },
            child: const Text("Load persons"),
          ),
          StoreConnector<AsyncReduxState, bool>(
            converter: (store) => store.state.isLoading,
            builder: (context, state) {
              if (state) {
                return const CircularProgressIndicator();
              } else {
                return const SizedBox();
              }
            },
          ),
          StoreConnector<AsyncReduxState, Iterable<Person>?>(
            converter: (store) => store.state.fetchedPersons,
            builder: (context, data) {
              if (data == null) {
                return const SizedBox();
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final person = data.elementAt(index);
                      return ListTile(
                        title: Text("${person.name}"),
                        subtitle: Text("${person.age} years old"),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
