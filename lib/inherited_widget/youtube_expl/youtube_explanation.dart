
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_management_course/inherited_widget/youtube_expl/dependencies_scope.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // registerFactory;
  //
  // registerSinglton<Database>(() => LocalDatabase(), instanceName: "");

  // registerSinglton<Database>(() => RemoteDatabase(), instanceName "");

  final logger = Logger();

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  final DependenciesContainer dependenciesContainer = DependenciesContainer(
    logger: logger,
    sharedPreferencesHelper: SharedPreferencesHelper(sharedPreferences),
  );

  runApp(
    RootApp(
      dependenciesContainer: dependenciesContainer,
    ),
  );
}

class RootApp extends StatefulWidget {
  //
  const RootApp({
    super.key,
    required this.dependenciesContainer,
  });

  final DependenciesContainer dependenciesContainer;

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DependenciesScope(
      dependenciesContainer: widget.dependenciesContainer,
      child: const MaterialApp(
        home: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final depContainer = DependenciesScope.of(context, listen: false).dependenciesContainer;
    return Scaffold(
      appBar: AppBar(
        title: const Text("IoC explanation"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            // depContainer.logger.log(Level.debug, "We added IoC using context in our app");

            await depContainer.sharedPreferencesHelper.saveString("dart", 'flutter');

            depContainer.sharedPreferencesHelper.printString("dart");
          },
          child: Text("Auth"),
        ),
      ),
    );
  }
}
