import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketClientService {
  Socket? socket;

  SocketClientService({this.socket});

  Future<void> connectToSocket(String url, {required void Function}) async {
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

  }

  Future<void> disconnectSocket() async =>  socket?.disconnect();
}
