import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_management_course/mobx/todo_mobx/store/todo_mobx_store.dart';

class TodoMobxPage extends StatefulWidget {
  const TodoMobxPage({super.key});

  @override
  State<TodoMobxPage> createState() => _TodoMobxPageState();
}

class _TodoMobxPageState extends State<TodoMobxPage> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    final todoMobxObservable = Provider.of<TodoMobxStoreObservable>(context, listen: false);

    _textEditingController = TextEditingController(text: '');

    // reaction are just a things that can react on observable changes

    // "when" -> when the given statement passes function will do something:
    when((value) => todoMobxObservable.todos.length >= 5, () {
      // do something here
      debugPrint("number is up 5");
    });

    // "autorun" checks any changes inside mobx store statement
    // it means that whenever state changes autorun will work
    // remember that when you will dispose widget (like closing the screen)
    // autorun will be automatically disposed
    autorun((_) {
      // you can also see what's happening inside any mobx
      // you can watch specific variable
      // for ex:
      debugPrint("length of list: ${todoMobxObservable.todos.length}");
      debugPrint("current view state: ${todoMobxObservable.showTypeOfTodos}");
    });

    // "reaction" allows you to listen only specific variable of mobx's store
    // and will listen that variable changes
    reaction(
      (_) => todoMobxObservable.showTypeOfTodos,
      (currentTypeOfView) => debugPrint("current type of view: ${currentTypeOfView.name}"),
    );

    // information about this function is inside of this function
    asyncWhenMobxFunc(todoMobxObservable);
  }

  void asyncWhenMobxFunc(TodoMobxStoreObservable todoMobxObservable) async {
    // wait till value changes to the specific value
    // than function finishes
    // for ex:
    // until out state becomes delete this "asyncWhen" will not finish
    await asyncWhen((_) => todoMobxObservable.showTypeOfTodos == ShowTypeOfTodos.deleted);
    debugPrint("future function completed");
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoMobxObservable = Provider.of<TodoMobxStoreObservable>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Todo mobx add")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final desc = _textEditingController.text.trim();
          if (desc.isEmpty) return;
          todoMobxObservable.addTodo(desc);
          _textEditingController.clear();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Wrap(
            spacing: 10,
            children:
                ShowTypeOfTodos.values
                    .map(
                      (e) => ElevatedButton(
                        onPressed: () {
                          todoMobxObservable.showType(e);
                        },
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
          ),
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(hintText: "Add Todo"),
          ),
          const SizedBox(height: 10),
          Observer(
            builder:
                (_) => ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: todoMobxObservable.visibleType.length,
                  itemBuilder: (context, index) {
                    final todo = todoMobxObservable.visibleType[index];
                    return ListTile(
                      title: Text(todo.description),
                      trailing: IconButton(
                        onPressed: () {
                          todoMobxObservable.removeTodo(todo);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}
