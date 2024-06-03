import 'package:redux/redux.dart';
import 'package:state_management_course/redux/filtered_items/models/add_item_action.dart';

Iterable<String> addItemReducer(Iterable<String> previousItems, AddItemAction addItem) {
  return previousItems.followedBy([addItem.item]);
}

Iterable<String> removeItemReducer(Iterable<String> previousItems, RemoveItemAction remove) {
  return previousItems.where((e) => e != remove.item);
}

Reducer<Iterable<String>> itemsReducer = combineReducers([
  TypedReducer<Iterable<String>, AddItemAction>(addItemReducer).call,
  TypedReducer<Iterable<String>, RemoveItemAction>(removeItemReducer).call,
]);
