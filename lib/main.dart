import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:state_management_course/flutter_riverpod/provider_observer/provider_observer.dart';
import 'package:state_management_course/flutter_riverpod/riverpod_number_trivia/riverpod_function_page.dart';
import 'package:state_management_course/flutter_riverpod/riverpod_number_trivia/riverpod_trivia_state_with_notifier/riverpod_trivia_state_with_notifier.dart';
import 'package:state_management_course/flutter_riverpod/riverpod_with_state/riverpod_with_state_page.dart';
import 'package:state_management_course/mobx/mobx_google_suggestion/store/mobx_google_suggestion_store.dart';
import 'package:state_management_course/mobx/mobx_with_streams/store/mobx_with_streams_store.dart';
import 'package:state_management_course/mobx/todo_mobx/store/todo_mobx_store.dart';
import 'package:state_management_course/provider/second_project/provider/datetime_provider.dart';
import 'package:state_management_course/redux/async_redux_example/state/async_redux_state.dart';
import 'bloc/lazy_load_simple_bloc/simple_bloc/simple_bloc_page.dart';
import 'inherited_widget/get_datetime_on_screen_tap/view/inherited_widget_page.dart';
import 'inherited_widget/todo_with_inherited_notifier/main_td_inhnot.dart';
import 'inherited_widget/todo_with_inherited_notifier/view/td_inhnot_view.dart';
import 'inherited_widget/todo_with_inherited_notifier/view_model/td_inh_view_model.dart';
import 'mobx/counter/store/counter_store.dart';
import 'provider/bread_crumb/provider/bread_crumb_provider.dart';
import 'redux/filtered_items/enums/filtered_items_enums.dart';
import 'redux/filtered_items/states/filtered_items_state.dart';
import 'redux/filtered_items/states/filtered_reducer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;

// mobx here
final counter = Counter(); // counter mobx state

// final todoMobxStoreState = TodoMobxStoreObservable(); // todos mobx state

//
void main() {
  runApp(const App());
}

// in redux create a single store that holds the whole application state
// REMEMBER!!! - SINGLE STORE (SINGLE STATE) FOR ENTIRE APP!
final stateSome = Store<FilteredItemsState>(
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
    return const SimpleBlocPage();
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

          // MOBX REGISTRATIONS
          Provider(
            create: (_) => TodoMobxStoreObservable(),
          ),
          Provider(
            create: (_) => MobxWithStreamsData(),
          ),
          Provider(
            create: (_) => MobxGoogleSuggestionStoreData(),
          )
        ],
        child: riverpod.ProviderScope(
          // for observables
          observers: [
            ProviderObserverHelper(),
          ],
          // for providers
          overrides: const [
            // you can register riverpod to the specific widget tree by using
            // similar code like this code below

            // riverpodTriviaStateWithNotifierProvider // <- THIS IS PROVIDER
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const TdInhNotView(),
          ),
        ),
      ),
    );
  }
}
