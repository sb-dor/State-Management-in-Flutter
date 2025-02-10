import 'package:flutter/material.dart';

class _PassingDataInhWidget extends InheritedWidget {
  const _PassingDataInhWidget({
    super.key,
    required this.passingDataWidgetState,
    required super.child,
  });

  static _PassingDataInhWidget of(BuildContext context, {bool listen = false}) => listen
      ? context.dependOnInheritedWidgetOfExactType<_PassingDataInhWidget>()!
      : context.getInheritedWidgetOfExactType<_PassingDataInhWidget>()!;

  final PassingDataWidgetState passingDataWidgetState;

  @override
  bool updateShouldNotify(_PassingDataInhWidget old) {
    return false;
  }
}

class PassingDataWidget extends StatefulWidget {
  const PassingDataWidget({super.key});

  static PassingDataWidgetState state(BuildContext context) =>
      _PassingDataInhWidget.of(context, listen: false).passingDataWidgetState;

  @override
  State<PassingDataWidget> createState() => PassingDataWidgetState();
}

// in flutter sdk states are not private at all
// programmers of flutter sdk dont do like this one
// that is why you can take a look "Navigator"'s state.
// The state of "Navigator" is not private at all.
// but if you want that some fields inside "State" shouldn't be visible
// outside of this library, just park them with annotation "@protected"
class PassingDataWidgetState extends State<PassingDataWidget> {
  final TextEditingController nameController = TextEditingController();

  // for test whether it's not visible out from this library
  @protected
  final TextEditingController surnameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test passing data"),
      ),
      body: _PassingDataInhWidget(
        passingDataWidgetState: this,
        child: _TestWidget(),
      ),
    );
  }
}

class _TestWidget extends StatelessWidget {
  const _TestWidget();

  @override
  Widget build(BuildContext context) {
    final passingDataInhWidget = PassingDataWidget.state(context);

    return TextField(
      controller: passingDataInhWidget.nameController,
    );
  }
}
