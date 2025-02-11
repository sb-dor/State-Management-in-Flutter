import 'package:flutter/material.dart';

abstract interface class HidingDataInInterfaces {
  TextEditingController get nameController;

  TextEditingController get surnameController;
}

class _HidingDataInInterfaceInhWidget extends InheritedWidget {
  const _HidingDataInInterfaceInhWidget({
    required super.child,
    required this.hidingDataInInterfaces,
  });

  final HidingDataInInterfaces hidingDataInInterfaces;

  static _HidingDataInInterfaceInhWidget of(BuildContext context, {bool listen = false}) => listen
      ? context.dependOnInheritedWidgetOfExactType<_HidingDataInInterfaceInhWidget>()!
      : context.getInheritedWidgetOfExactType<_HidingDataInInterfaceInhWidget>()!;

  @override
  bool updateShouldNotify(_HidingDataInInterfaceInhWidget old) {
    return false;
  }
}

class HidingDataInterfaceWidget extends StatefulWidget {
  const HidingDataInterfaceWidget({super.key});

  static HidingDataInInterfaces hidingDataInInterfaces(BuildContext context) =>
      _HidingDataInInterfaceInhWidget.of(context, listen: false).hidingDataInInterfaces;

  @override
  State<HidingDataInterfaceWidget> createState() => _HidingDataInterfaceWidgetState();
}

class _HidingDataInterfaceWidgetState extends State<HidingDataInterfaceWidget>
    implements HidingDataInInterfaces {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();

  @override
  TextEditingController get nameController => _nameController;

  @override
  TextEditingController get surnameController => _surnameController;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _HidingDataInInterfaceInhWidget(
      hidingDataInInterfaces: this,
      child: _TextFields(),
    );
  }
}

class _TextFields extends StatelessWidget {
  const _TextFields();

  @override
  Widget build(BuildContext context) {
    final hiddenInterface = HidingDataInterfaceWidget.hidingDataInInterfaces(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Test with interface"),
      ),
      body: Column(
        children: [
          TextField(
            controller: hiddenInterface.nameController,
          ),
          TextField(
            controller: hiddenInterface.surnameController,
          ),
          TextButton(
            onPressed: () {
              print(hiddenInterface.nameController.text);
              print(hiddenInterface.surnameController.text);
            },
            child: Text(
              "Print controller",
            ),
          )
        ],
      ),
    );
  }
}
