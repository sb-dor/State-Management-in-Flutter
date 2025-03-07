import 'package:redux/redux.dart';
import 'package:state_management_course/redux/filtered_items/enums/filtered_items_enums.dart';
import 'package:state_management_course/redux/filtered_items/models/add_item_action.dart';
import 'package:state_management_course/redux/filtered_items/models/filtered_actions.dart';
import 'package:state_management_course/redux/filtered_items/states/filtered_items_state.dart';

// the code which was written right after this function
// is the code that you can replace with this function
Iterable<String> addAndRemoveFromItems(Iterable<String> prevItems, action) {
  var prevToList = prevItems.toList();
  if (action is AddItemAction) {
    prevToList.add(action.item);
  } else if (action is RemoveItemAction) {
    prevToList.removeWhere(
      (e) => e.trim().toLowerCase() == action.item.trim().toLowerCase(),
    );
  }
  return prevToList;
}

// function above is replacement for code from here
// ---
Iterable<String> addItemReducer(
  Iterable<String> previousItems,
  AddItemAction addItem,
) {
  return previousItems.followedBy([addItem.item]);
}

// these codes represent the Redux functionality

Iterable<String> removeItemReducer(
  Iterable<String> previousItems,
  RemoveItemAction remove,
) {
  return previousItems.where((e) => e != remove.item);
}

Reducer<Iterable<String>> itemsReducer = combineReducers([
  TypedReducer<Iterable<String>, AddItemAction>(addItemReducer).call,
  TypedReducer<Iterable<String>, RemoveItemAction>(removeItemReducer).call,
]);
// ---
// till here

ItemFilter itemFilterReducer(FilteredItemsState oldState, action) {
  if (action is ChangeFilterTypeAction) {
    return action.filter;
  } else {
    return oldState.filter;
  }
}

// all states here
FilteredItemsState appStateReducer(FilteredItemsState oldState, action) {
  return FilteredItemsState(
    // you can also you "itemsReducer" from above
    items: addAndRemoveFromItems(oldState.items, action), // the list
    filter: itemFilterReducer(oldState, action), // the filter
    // and many more data that should be kept inside State
  );
}
