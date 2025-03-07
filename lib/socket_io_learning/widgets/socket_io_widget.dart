import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_course/socket_io_learning/models/chat.dart';
import 'package:state_management_course/socket_io_learning/socket_bloc/socket_bloc.dart';
import 'package:state_management_course/socket_io_learning/socket_service/socket_client_service.dart';
import 'package:state_management_course/socket_io_learning/widgets/socket_io_user_widget.dart';

class SocketIoWidget extends StatelessWidget {
  const SocketIoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocketBloc(SocketClientService()),
      child: const _SocketIoWidgetUI(),
    );
  }
}

class _SocketIoWidgetUI extends StatefulWidget {
  const _SocketIoWidgetUI();

  @override
  State<_SocketIoWidgetUI> createState() => _SocketIoWidgetState();
}

class _SocketIoWidgetState extends State<_SocketIoWidgetUI> {
  @override
  void initState() {
    super.initState();
    context.read<SocketBloc>().add(const SocketEvent.initialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Socket io learning")),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return GestureDetector(
            onTap: () {
              final socketBloc = context.read<SocketBloc>();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SocketIoUserWidget(user: chat.user, socketBloc: socketBloc),
                ),
              );
            },
            child: ColoredBox(
              color: Colors.deepPurpleAccent.shade200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("User: ${chat.user.name}", style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
