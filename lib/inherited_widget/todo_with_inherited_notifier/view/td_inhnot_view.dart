import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:state_management_course/inherited_widget/todo_with_inherited_notifier/td_inhnot.dart';
import 'package:state_management_course/inherited_widget/todo_with_inherited_notifier/view_model/td_inh_view_model.dart';

class TempMock extends ChangeNotifier {}

class TdInhNotView extends StatefulWidget {
  const TdInhNotView({super.key});

  @override
  State<TdInhNotView> createState() => _TdInhNotViewState();
}

class _TdInhNotViewState extends State<TdInhNotView> {
  final TextEditingController _todoTextController = TextEditingController();

  // final GlobalKey key = GlobalKey();

  @override
  void dispose() {
    _todoTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((v) {
      // TdInhNot.read(context)?.tdInhViewModel.initTodos();
      OwnChangeNotifierProvider.read<TdInhViewModel>(context)?.initTodos();
      // OwnMultiProvider.read<TdInhViewModel>(context)?.initTodos();
      // final renderBoc = key.currentContext?.findRenderObject() as RenderBox;
      // final offset = renderBoc.localToGlobal(Offset.zero);
      // print("widget offset: $offset");
    });
  }

  @override
  Widget build(BuildContext context) {
    // final todoInhNot = TdInhNot.watch(context);
    final todoInhNot = OwnChangeNotifierProvider.watch<TdInhViewModel>(context);
    // final todoInhNot = OwnMultiProvider.watch<TdInhViewModel>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(largeTitle: Text("Todo with MVVM")),

          // for test one
          SliverToBoxAdapter(
            child: OwnChangeNotifierProvider(
              provider: TdInhViewModel(),
              child: Builder(
                builder: (context) {
                  final intValue = OwnChangeNotifierProvider.watch<TdInhViewModel>(context);
                  return TextButton(
                    onPressed: () {
                      if (_todoTextController.text.trim().isEmpty) return;
                      OwnChangeNotifierProvider.read<TdInhViewModel>(
                        context,
                      )?.addTodo(_todoTextController.text.trim());
                    },
                    child: Text("${intValue?.todoListMVVMStateModel.todoMVVM.length}"),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              // key: key,
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoTextFormFieldRow(
                      controller: _todoTextController,
                      prefix: const Text("TODO name"),
                      placeholder: "Enter Text",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_todoTextController.text.trim().isEmpty) return;
                      // todoInhNot?.tdInhViewModel.addTodo(_todoTextController.text.trim());
                      todoInhNot?.addTodo(_todoTextController.text.trim());
                    },
                    icon: const Icon(CupertinoIcons.add, color: CupertinoColors.activeGreen),
                  ),
                ],
              ),
            ),
          ),
          // if ((todoInhNot?.tdInhViewModel.todoListMVVMStateModel.loading ?? false))
          if ((todoInhNot?.todoListMVVMStateModel.loading ?? false))
            SliverFillRemaining(
              child: Center(
                child:
                    defaultTargetPlatform == TargetPlatform.iOS
                        ? const CupertinoActivityIndicator()
                        : const CircularProgressIndicator(),
              ),
            )
          else
            const _SeparatedList(),
        ],
      ),
    );
  }
}

class _SeparatedList extends StatelessWidget {
  const _SeparatedList();

  @override
  Widget build(BuildContext context) {
    // final todoInhNot = TdInhNot.watch(context);
    final todoInhNot = OwnChangeNotifierProvider.watch<TdInhViewModel>(context);
    // final todoInhNot = OwnMultiProvider.watch<TdInhViewModel>(context);
    return SliverList.separated(
      itemCount: todoInhNot?.todoListMVVMStateModel.todoMVVM.length,
      itemBuilder: (context, index) {
        final item = todoInhNot?.todoListMVVMStateModel.todoMVVM[index];
        return CupertinoListTile(
          title: Text(item?.todo ?? ''),
          trailing: IconButton(
            onPressed: () {
              todoInhNot?.removeTodo(item!);
            },
            icon: const Icon(CupertinoIcons.delete),
            color: CupertinoColors.destructiveRed,
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
