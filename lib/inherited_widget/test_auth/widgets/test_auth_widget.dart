import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_management_course/inherited_widget/test_auth/models/test_auth_user.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(TestAuthApp());
}

class TestAuthInhWidget extends InheritedWidget {
  const TestAuthInhWidget({super.key, required super.child, required this.testAuthAppState});

  static TestAuthAppState of(BuildContext context, {bool listen = true}) {
    if (listen) {
      final widget = context.dependOnInheritedWidgetOfExactType<TestAuthInhWidget>();
      assert(widget != null, 'No TestAuthInhWidget found in context');
      return widget!.testAuthAppState;
    } else {
      final widget = context.getElementForInheritedWidgetOfExactType<TestAuthInhWidget>()?.widget;
      assert(widget is TestAuthInhWidget, "No TestAuthInhWidget found in context");
      return (widget as TestAuthInhWidget).testAuthAppState;
    }
  }

  final TestAuthAppState testAuthAppState;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class TestAuthApp extends StatefulWidget {
  const TestAuthApp({super.key});

  @override
  State<TestAuthApp> createState() => TestAuthAppState();
}

class TestAuthAppState extends State<TestAuthApp> {
  TestAuthUser? testAuthUser;

  void auth() {
    setState(() {
      testAuthUser = TestAuthUser(Uuid().v4(), "sb-dor");
    });
  }

  void logout() {
    setState(() {
      testAuthUser = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TestAuthInhWidget(testAuthAppState: this, child: MaterialApp(home: AuthWidget()));
  }
}

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    final testAppState = TestAuthInhWidget.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(testAppState.testAuthUser?.name ?? '-'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TestLogutWidget()));
            },
            child: Text("Push"),
          ),
        ],
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            TestAuthInhWidget.of(context, listen: false).auth();
          },
          icon: Icon(Icons.auto_fix_high),
        ),
      ),
    );
  }
}

class TestLogutWidget extends StatefulWidget {
  const TestLogutWidget({super.key});

  @override
  State<TestLogutWidget> createState() => _TestLogutWidgetState();
}

class _TestLogutWidgetState extends State<TestLogutWidget> {
  @override
  Widget build(BuildContext context) {
    final testAppState = TestAuthInhWidget.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(testAppState.testAuthUser?.name ?? '-')),
      body: Center(
        child: IconButton(
          onPressed: () {
            TestAuthInhWidget.of(context, listen: false).logout();
          },
          icon: Icon(Icons.logout),
        ),
      ),
    );
  }
}
