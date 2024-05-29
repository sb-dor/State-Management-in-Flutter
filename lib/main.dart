import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/bread_crumb/provider/bread_crumb_provider.dart';
import 'provider/bread_crumb/views/bread_crumb_page.dart';

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
