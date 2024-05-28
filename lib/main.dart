import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_course/inherited_widget/view/inherited_widget_page.dart';
import 'package:state_management_course/provider/first_project/provider/bread_crumb_provider.dart';
import 'package:state_management_course/provider/first_project/views/bread_crumb_page.dart';

import 'vanilla_contacts/views/vanilla_contact_page.dart';

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
        ChangeNotifierProvider(
          create: (_) => BreadCrumbProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BreadCrumbPage(),
      ),
    );
  }
}
