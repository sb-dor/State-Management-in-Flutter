import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management_course/main.dart';
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
    _textEditingController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo mobx add"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final desc = _textEditingController.text.trim();
          if (desc.isEmpty) return;
          todoMobxStoreState.addTodo(desc);
        },
        child: const Icon(Icons.add),
      ),
      body: Observer(builder: (_) {
        return ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Wrap(
              spacing: 10,
              children: ShowTypeOfTodos.values
                  .map(
                    (e) => ElevatedButton(onPressed: () {
                      todoMobxStoreState.showType(e);
                    }, child: Text(e.name)),
                  )
                  .toList(),
            ),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(hintText: "Add Todo"),
            ),
            const SizedBox(height: 10),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: todoMobxStoreState.visibleType.length,
              itemBuilder: (context, index) {
                final todo = todoMobxStoreState.visibleType[index];
                return ListTile(
                  title: Text(todo.description),
                  trailing: IconButton(
                    onPressed: () {
                      todoMobxStoreState.removeTodo(todo);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
