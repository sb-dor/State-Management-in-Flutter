import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketClientService {
  Socket? socket;

  SocketClientService({this.socket});

  Future<void> connectToSocket(
    String url, {
    required Map<String, Function(dynamic data)> handlers,
  }) async {
    if (socket != null) return;
    socket = io(url, {
      'transports': ['websocket'],
      'force new connection': true,
    });

    socket?.onConnect((data) {
      debugPrint("onConnect: $data");
    });
    socket?.onDisconnect((data) {
      debugPrint("on disconnect: data");
    });
    socket?.onConnectError((data) {
      debugPrint("on connection error");
    });

    // do specific thing on event that comes from server
    for (final each in handlers.entries) {
      socket?.on(each.key, each.value);
    }
  }

  Future<void> disconnectSocket() async => socket?.disconnect();

  void echo(String message) {
    assert((socket?.connected ?? false), "Socket must be connected");
    socket?.emit('echo', message); // event's name is echo
  }

  void broadcast(String message) {
    assert((socket?.connected ?? false), "Socket must be connected");
    socket?.emit('broadcast', message);
  }

  void messageToRoom(String message, String room) {
    assert((socket?.connected ?? false), "Socket must be connected");
    socket?.emit('room', {"room": room, "message": message});
  }

  void joinToRoom(String room) {
    assert((socket?.connected ?? false), "Socket must be connected");
    socket?.emit("joinRoom", room);
  }
}
