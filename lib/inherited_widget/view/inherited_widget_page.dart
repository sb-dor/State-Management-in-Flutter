import 'package:flutter/material.dart';
import 'package:state_management_course/inherited_widget/api/inh_api.dart';
import 'package:state_management_course/inherited_widget/inherited_widget_helper/inherited_widget_helper.dart';

///
///
/// [I would say that using InheritedWidget as a State-management is not the good idea]
class InheritedWidgetPage extends StatefulWidget {
  const InheritedWidgetPage({super.key});

  @override
  State<InheritedWidgetPage> createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  String dateTime = DateTime.now().toIso8601String();

  @override
  Widget build(BuildContext context) {
    return InheritedWidgetHelper(
      api: InhApi(),
      child: const _InheritedScreen(),
    );
  }
}

class _InheritedScreen extends StatefulWidget {
  const _InheritedScreen();

  @override
  State<_InheritedScreen> createState() => _InheritedScreenState();
}

class _InheritedScreenState extends State<_InheritedScreen> {
  ValueKey _valueKey = const ValueKey<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // this appBar's text will change anyway...
        title: Text(InheritedWidgetHelper.of(context).api.dateAndTime ?? ''),
      ),
      body: GestureDetector(
        onTap: () async {
          final api = InheritedWidgetHelper.of(context).api;
          final dateAndTime = await api.getDateAndTime();
          _valueKey = ValueKey(dateAndTime);
          setState(() {});
        },
        child: Container(
          color: Colors.white,
          child: SizedBox.expand(
            child: Center(
              // ... but this widget will not because it's a constant
              // you can either remove the "const" value from "SizedBox.expand"
              // or create the new key every time and pass through this widget (you will remove the "constant" value anyway)
              child: _InheritedDateTimeWidget(key: _valueKey),
            ),
          ),
        ),
      ),
    );
  }
}

class _InheritedDateTimeWidget extends StatelessWidget {
  const _InheritedDateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final api = InheritedWidgetHelper.of(context).api;

    return Text(
      api.dateAndTime ?? "Tap on screen to fetch date and time",
    );
  }
}
