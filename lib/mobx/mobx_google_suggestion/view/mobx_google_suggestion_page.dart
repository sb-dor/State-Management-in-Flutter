import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_management_course/mobx/mobx_google_suggestion/store/mobx_google_suggestion_store.dart';

class MobxGoogleSuggestionPage extends StatefulWidget {
  const MobxGoogleSuggestionPage({super.key});

  @override
  State<MobxGoogleSuggestionPage> createState() => _MobxGoogleSuggestionPageState();
}

class _MobxGoogleSuggestionPageState extends State<MobxGoogleSuggestionPage> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _textEditingController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mobxGoogleSuggestionsStore = Provider.of<MobxGoogleSuggestionStoreData>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobx google search suggestions"),
      ),
      body: Observer(builder: (_) {
        return ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(hintText: "Search"),
              onChanged: (v) => mobxGoogleSuggestionsStore.loadDataFromGoogle(v),
            ),
            if (mobxGoogleSuggestionsStore.loadingApi)
              const Center(child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ))
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mobxGoogleSuggestionsStore.suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = mobxGoogleSuggestionsStore.suggestions[index];
                  return ListTile(
                    title: Text(suggestion.name),
                  );
                },
              ),
          ],
        );
      }),
    );
  }
}
