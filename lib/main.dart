import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:state_management_course/mobx/counter/view/counter_mobx_page.dart';
import 'package:state_management_course/mobx/todo_mobx/store/todo_mobx_store.dart';
import 'package:state_management_course/mobx/todo_mobx/view/todo_mobx_page.dart';
import 'package:state_management_course/provider/second_project/provider/datetime_provider.dart';
import 'package:state_management_course/redux/async_redux_example/state/async_redux_state.dart';
import 'package:state_management_course/redux/async_redux_example/view/async_redux_page.dart';
import 'mobx/counter/store/counter_store.dart';
import 'provider/bread_crumb/provider/bread_crumb_provider.dart';
import 'provider/bread_crumb/views/bread_crumb_page.dart';
import 'provider/second_project/views/second_provider_project_page.dart';
import 'redux/filtered_items/enums/filtered_items_enums.dart';
import 'redux/filtered_items/states/filtered_items_state.dart';
import 'redux/filtered_items/states/filtered_reducer.dart';
import 'redux/filtered_items/view/redux_filtered_items_page.dart';

// mobx here
final counter = Counter(); // counter mobx state

final todoMobxStoreState = TodoMobxStoreObservable(); // todos mobx state


//
void main() {
  runApp(const App());
}

// in redux create a single store that holds the whole application state
// REMEMBER!!! - SINGLE STORE (SINGLE STATE) FOR ENTIRE APP!
final state = Store<FilteredItemsState>(
  appStateReducer,
  initialState: const FilteredItemsState(items: [], filter: ItemFilter.all),
);

final asyncState = Store<AsyncReduxState>(asyncReduxReducer,
    initialState: const AsyncReduxState.empty(),
    middleware: [
      loadPeopleMiddleware,
    ]);

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      // Redux's store provider
      store: asyncState,
      child: MultiProvider(
        // Provider package
        providers: [
          ChangeNotifierProvider<BreadCrumbProvider>(
            create: (_) => BreadCrumbProvider(),
          ),
          ChangeNotifierProvider<DatetimeProvider>(
            create: (_) => DatetimeProvider(),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TodoMobxPage(),
        ),
      ),
    );
  }
}
