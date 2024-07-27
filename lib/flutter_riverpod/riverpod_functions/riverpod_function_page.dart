import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_course/flutter_riverpod/riverpod_functions/riverpod_trivia_state_with_notifier/riverpod_trivia_state_with_notifier.dart';

import 'riverpod_function_state/riverpod_function_state.dart';

class RiverpodFunctionPage extends ConsumerWidget {
  const RiverpodFunctionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final riverpodFunction = ref.watch(triviaProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod functions"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            riverpodFunction.when(
              data: (data) => Column(
                children: [
                  Text(
                    "Name: ${data.text}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text("Number: ${riverpodFunction.value?.number ?? '-'}"),
                  const SizedBox(height: 20),
                ],
              ),
              error: (error, stacktrace) => const Text("Error occreed, please try again later"),
              loading: () => const CircularProgressIndicator(),
            ),
            ElevatedButton(
              onPressed: () {
                // for function "riverpod"
                // in order recall function
                // you have to use the code below

                // whenever user try to click button several times
                // "ref.invalidate(anyProvider)" will work only once
                ref.invalidate(triviaProvider);
              },
              child: const Text(
                "Find Trivia",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    constraints:
                        BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return const _DialogWidget();
                    });
              },
              child: const Text(
                "List of trivais",
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DialogWidget extends ConsumerWidget {
  const _DialogWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberTrivialRiverpod = ref.watch(riverpodTriviaStateWithNotifierProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Number of trivias"),
          actions: [
            IconButton(
              onPressed: () => ref.invalidate(triviasProvider),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: numberTrivialRiverpod.when(
          data: (list) {
            return ListView.separated(
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.grey[300],
                      ),
                    ),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final trivia = list[index];
                  return ListTile(
                    title: trivia.edit
                        ? TextField(
                            controller: trivia.textEditingController,
                            maxLines: null,
                          )
                        : Text("Trivia: ${trivia.text}"),
                    subtitle: Text("Trivia number: ${trivia.number}"),
                    leading: IconButton(
                      onPressed: () {
                        if (trivia.edit) {
                          ref
                              .read(riverpodTriviaStateWithNotifierProvider.notifier)
                              .saveTriviaText(trivia);
                        } else {
                          ref
                              .read(riverpodTriviaStateWithNotifierProvider.notifier)
                              .showEdit(trivia);
                        }
                      },
                      icon: Icon(
                        trivia.edit ? Icons.save : Icons.edit,
                      ),
                    ),
                  );
                });
          },
          error: (error, trace) {
            return Text("Error is: $trace");
          },
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
