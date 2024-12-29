import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_course/socket_io_learning/models/user.dart';
import 'package:state_management_course/socket_io_learning/socket_bloc/socket_bloc.dart';

class SocketIoUserWidget extends StatefulWidget {
  final User user;
  final SocketBloc socketBloc;

  const SocketIoUserWidget({
    super.key,
    required this.user,
    required this.socketBloc,
  });

  @override
  State<SocketIoUserWidget> createState() => _SocketIoUserWidgetState();
}

class _SocketIoUserWidgetState extends State<SocketIoUserWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.socketBloc.add(SocketEvent.joinToTheRoom(widget.user));
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(hintText: "Add message"),
            ),
            TextButton(
              onPressed: () {
                if (_textEditingController.text.trim().isEmpty) return;
                widget.socketBloc.add(
                      SocketEvent.sendMessage(
                        _textEditingController.text.trim(),
                      ),
                    );
              },
              child: const Text("Send"),
            ),
          ],
        ),
      ),
    );
  }
}
