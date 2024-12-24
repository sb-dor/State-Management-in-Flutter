import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'socket_bloc.freezed.dart';

@freezed
class SocketEvent with _$SocketEvent {
  const factory SocketEvent.started() = _Started;
}

@freezed
class SocketState with _$SocketState {
  const factory SocketState.initial() = _Initial;
}

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  late IO.Socket socket;

  SocketBloc() : super(const SocketState.initial()) {
    on<SocketEvent>(
      (event, emit) => event.map(
        started: (event) => _started(event, emit),
      ),
    );
  }

  void _started(
    _Started event,
    Emitter<SocketState> emit,
  ) async {

    socket = IO.io(
      "http://192.168.100.3:6001",
    );
    socket.on("connection", (socket) {
      socket.join("some room");
    });
  }
}
