import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'riverpod_function_state/riverpod_function_state.dart';
import 'riverpod_number_trivia_model.dart';
import 'riverpod_trivia_state_with_notifier/riverpod_trivia_state_with_notifier.dart';

class RiverpodFunctionPage extends ConsumerWidget {
  const RiverpodFunctionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            const _FirstWidgetWithProviderScope(),
            const _SecondWidgetWithProviderScope(),
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

class _FirstWidgetWithProviderScope extends StatelessWidget {
  const _FirstWidgetWithProviderScope({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        triviaProvider,
      ],
      child: Consumer(
        builder: (context, ref, child) {
          final riverpodFunction = ref.watch(triviaProvider);
          return riverpodFunction.isLoading
              ? const CircularProgressIndicator()
              : riverpodFunction.when(
                  data: (data) => Column(
                    children: [
                      Text(
                        "Name: ${data?.text}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text("Number: ${riverpodFunction.value?.number ?? '-'}"),
                      const SizedBox(height: 20),
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
                    ],
                  ),
                  error: (error, stacktrace) => const Text("Error occreed, please try again later"),
                  loading: () => const CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class _SecondWidgetWithProviderScope extends StatelessWidget {
  const _SecondWidgetWithProviderScope({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [triviaProvider],
      child: Consumer(
        builder: (context, ref, child) {
          final riverpodFunction = ref.watch(triviaProvider);
          return riverpodFunction.isLoading
              ? const CircularProgressIndicator()
              : riverpodFunction.when(
                  data: (data) => Column(
                    children: [
                      Text(
                        "Name: ${data?.text}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text("Number: ${riverpodFunction.value?.number ?? '-'}"),
                      const SizedBox(height: 20),
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
                    ],
                  ),
                  error: (error, stacktrace) => const Text("Error occreed, please try again later"),
                  loading: () => const CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class _DialogWidget extends ConsumerWidget {
  const _DialogWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberTrivialRiverpod = ref.watch(riverpodTriviaStateWithNotifierProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Number of trivias"),
          scrolledUnderElevation: 0,
          actions: [
            IconButton(
              onPressed: () => ref.invalidate(otherRiverpodForTheCombiningProvidersProvider),
              icon: const Icon(Icons.update),
            ),
            IconButton(
              onPressed: () => ref.invalidate(riverpodTriviaStateWithNotifierProvider),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        //  When the listened to provider changes and our request recomputes,
        //  the previous state is kept until the new request is completed.
        //  At the same time, while the request is pending, the "isLoading" and "isReloading" flags will be set.
        //
        //  This enables UI to either show the previous state or a loading indicator, or even both.Ï
        body: numberTrivialRiverpod.isLoading
            ? const Center(child: CircularProgressIndicator())
            : numberTrivialRiverpod.when<Widget>(
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
                      return Card(
                        child: ListTile(
                          title: trivia.edit
                              ? TextField(
                                  controller: trivia.textEditingController,
                                  maxLines: null,
                                  onSubmitted: (v) {
                                    ref
                                        .read(riverpodTriviaStateWithNotifierProvider.notifier)
                                        .saveTriviaText(trivia);
                                  },
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
                        ),
                      );
                    },
                  );
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
