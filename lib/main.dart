import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_course/provider/second_project/provider/datetime_provider.dart';
import 'provider/bread_crumb/provider/bread_crumb_provider.dart';
import 'provider/bread_crumb/views/bread_crumb_page.dart';
import 'provider/second_project/views/second_provider_project_page.dart';
import 'redux/filtered_items/view/redux_filtered_items_page.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
        home: ReduxFilteredItemsPage(),
      ),
    );
  }
}
