import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:state_management_course/socket_io_learning/socket_service/socket_client_service.dart';

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
  final SocketClientService _socketClientService;

  SocketBloc(this._socketClientService) : super(const SocketState.initial()) {
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
    await _socketClientService.connectToSocket(
      "http://192.168.100.3:3000", // port does not matter
      handlers: {
        "echo": (data) {},
        "joinRoom": (data) {},
        "room": (data) {},
      },
    );
  }

  @override
  Future<void> close() {
    _socketClientService.disconnectSocket();
    return super.close();
  }
}
