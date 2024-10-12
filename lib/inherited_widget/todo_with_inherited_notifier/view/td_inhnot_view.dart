import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:state_management_course/inherited_widget/todo_with_inherited_notifier/view_model/td_inhnot.dart';
import 'package:state_management_course/inherited_widget/todo_with_inherited_notifier/view_model/view_model/td_inh_view_model.dart';

// class TempMock extends ChangeNotifier {}

class TdInhNotView extends StatefulWidget {
  const TdInhNotView({super.key});

  @override
  State<TdInhNotView> createState() => _TdInhNotViewState();
}

class _TdInhNotViewState extends State<TdInhNotView> {
  // this stateful widget is just for creating state on the top that's all
  // we will pass whole logic down to the widget tree
  // and we will change value wherever we want
  // even you can write class itself without creating object
  final TdInhViewModel _viewModel = TdInhViewModel();

  @override
  Widget build(BuildContext context) {
    return OwnChangeNotifierProvider(
      provider: _viewModel,
      child: const _TdInhNotViewHelper(),
    );
  }
}

class _TdInhNotViewHelper extends StatefulWidget {
  const _TdInhNotViewHelper({super.key});

  @override
  State<_TdInhNotViewHelper> createState() => _TdInhNotViewHelperState();
}

class _TdInhNotViewHelperState extends State<_TdInhNotViewHelper> {
  final TextEditingController _todoTextController = TextEditingController();

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
          const CupertinoSliverNavigationBar(
            largeTitle: Text("Todo with MVVM"),
          ),

          // for test one
          // SliverToBoxAdapter(
          //   child: ChangeNotifierProvider<TodoMvvmViewModel>(
          //     create: (context) => TodoMvvmViewModel(),
          //     builder: (context, child) {
          //       return child!;
          //     },
          //     child: Builder(
          //       builder: (context) {
          //         final intValue = context.watch<TodoMvvmViewModel>();
          //         return TextButton(
          //           onPressed: () {
          //             if (_todoTextController.text.trim().isEmpty) return;
          //             context.read<TodoMvvmViewModel>().addTodo(_todoTextController.text.trim());
          //           },
          //           child: Text("${intValue.todoListMVVMStateService.todoMVVM.length}"),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
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
                  icon: const Icon(
                    CupertinoIcons.add,
                    color: CupertinoColors.activeGreen,
                  ),
                ),
              ],
            ),
          ),
          // if ((todoInhNot?.tdInhViewModel.todoListMVVMStateModel.loading ?? false))
          if ((todoInhNot?.todoListMVVMStateModel.loading ?? false))
            SliverFillRemaining(
              child: Center(
                child: defaultTargetPlatform == TargetPlatform.iOS
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
  const _SeparatedList({super.key});

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
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
