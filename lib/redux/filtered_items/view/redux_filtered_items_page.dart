import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management_course/main.dart';
import 'package:state_management_course/redux/filtered_items/enums/filtered_items_enums.dart';
import 'package:state_management_course/redux/filtered_items/models/add_item_action.dart';
import 'package:state_management_course/redux/filtered_items/models/filtered_actions.dart';
import 'package:state_management_course/redux/filtered_items/states/filtered_items_state.dart';

class ReduxFilteredItemsPage extends StatefulWidget {
  const ReduxFilteredItemsPage({super.key});

  @override
  State<ReduxFilteredItemsPage> createState() => _ReduxFilteredItemsPageState();
}

class _ReduxFilteredItemsPageState extends State<ReduxFilteredItemsPage> {

  final TextEditingController _textEditingController = TextEditingController(text: '');

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter Resux app"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  state.dispatch(
                    const ChangeFilterTypeAction(ItemFilter.all),
                  );
                },
                child: const Text("All"),
              ),
              TextButton(
                onPressed: () {
                  state.dispatch(
                    const ChangeFilterTypeAction(ItemFilter.shortTexts),
                  );
                },
                child: const Text("Short Items"),
              ),
              TextButton(
                onPressed: () {
                  state.dispatch(
                    const ChangeFilterTypeAction(ItemFilter.longTexts),
                  );
                },
                child: const Text("Long Items"),
              ),
            ],
          ),
          TextField(
            controller: _textEditingController,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  final text = _textEditingController.text.trim();
                  if (text.isEmpty) return;
                  state.dispatch(AddItemAction(text));
                  _textEditingController.clear();
                },
                child: const Text("Add"),
              ),
              TextButton(
                onPressed: () {
                  final text = _textEditingController.text.trim();
                  if (text.isEmpty) return;
                  state.dispatch(RemoveItemAction(text));
                  _textEditingController.clear();
                },
                child: const Text("Remove"),
              ),
            ],
          ),
          StoreConnector<FilteredItemsState, Iterable<String>>(
            converter: (store) => store.state.filteredItems,
            builder: (context, data) {
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Text(data.elementAt(index));
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
