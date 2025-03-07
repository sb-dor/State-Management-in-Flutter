import 'package:flutter/material.dart';
import 'package:state_management_course/inherited_widget/todo_with_inherited_notifier/td_inhnot.dart';
import 'package:state_management_course/inherited_widget/todo_with_inherited_notifier/view/td_inhnot_view.dart';
import 'view_model/td_inh_view_model.dart';

// it's not a good idea
// better use provider package

// info about wrapping inherits above material app:
// https://stackoverflow.com/questions/66882776/pass-data-to-multiple-screens-with-inheritedwidget
class MainTdInhNot extends StatefulWidget {
  const MainTdInhNot({super.key});

  @override
  State<MainTdInhNot> createState() => _MainTdInhNotState();
}

class _MainTdInhNotState extends State<MainTdInhNot> {
  final _tdInhVM = TdInhViewModel();
  final _tempMock = TempMock();

  @override
  Widget build(BuildContext context) {
    return OwnChangeNotifierProvider(
      provider: _tdInhVM,
      child: OwnChangeNotifierProvider(
        provider: _tempMock,
        child: const MaterialApp(home: TdInhNotView()),
      ),
    );
  }
}
