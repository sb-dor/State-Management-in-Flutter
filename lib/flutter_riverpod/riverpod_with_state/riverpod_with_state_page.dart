import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_course/flutter_riverpod/riverpod_with_state/riverpod_with_state/riverpod/riverpod_state_helper.dart';

class RiverpodWithStatePage extends ConsumerStatefulWidget {
  const RiverpodWithStatePage({super.key});

  @override
  ConsumerState createState() => _RiverpodWithStatePageState();
}

class _RiverpodWithStatePageState extends ConsumerState<RiverpodWithStatePage> {
  @override
  void initState() {
    super.initState();
    ref.read(riverpodStateHelperProvider.notifier).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final riverpodStateHelper = ref.watch(riverpodStateHelperProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod with stateModel page")),
      body: ListView.separated(
        separatorBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.grey[300]),
            ),
        itemCount: riverpodStateHelper.numberTrivias?.length ?? 0,
        itemBuilder: (context, index) {
          final trivia = riverpodStateHelper.numberTrivias![index];
          return Card(
            child: ListTile(
              title:
                  trivia.edit
                      ? TextField(
                        controller: trivia.textEditingController,
                        maxLines: null,
                        onSubmitted: (v) {
                          ref
                              .read(riverpodStateHelperProvider.notifier)
                              .saveTriviaText(trivia);
                        },
                      )
                      : Text("Trivia: ${trivia.text}"),
              subtitle: Text("Trivia number: ${trivia.number}"),
              leading: IconButton(
                onPressed: () {
                  if (trivia.edit) {
                    ref
                        .read(riverpodStateHelperProvider.notifier)
                        .saveTriviaText(trivia);
                  } else {
                    ref
                        .read(riverpodStateHelperProvider.notifier)
                        .showEdit(trivia);
                  }
                },
                icon: Icon(trivia.edit ? Icons.save : Icons.edit),
              ),
            ),
          );
        },
      ),
    );
  }
}
