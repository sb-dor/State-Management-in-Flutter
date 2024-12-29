import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:state_management_course/socket_io_learning/models/user.dart';
import 'package:state_management_course/socket_io_learning/socket_service/socket_client_service.dart';

part 'socket_bloc.freezed.dart';

@freezed
class SocketEvent with _$SocketEvent {
  const factory SocketEvent.initialEvent() = _InitialEventOnSocketEvent;

  const factory SocketEvent.joinToTheRoom(User user) = _JoinToTheRoomEventOnSocketEvent;

  const factory SocketEvent.sendMessage(String message) = _SendMessageEvemtOnSocketEvent;

  const factory SocketEvent.handleMessage(dynamic data) = _HandleMessagesEventOnSocketEvent;
}

@freezed
class SocketState with _$SocketState {
  const factory SocketState.initial({User? user}) = _Initial;
}

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  final SocketClientService _socketClientService;

  SocketBloc(this._socketClientService) : super(const SocketState.initial()) {
    on<SocketEvent>(
      (event, emit) => event.map(
        initialEvent: (event) => _init(event, emit),
        joinToTheRoom: (event) => _joinToTheRoom(event, emit),
        sendMessage: (event) => _sendMessage(event, emit),
      ),
    );
  }

  void _init(
    _InitialEventOnSocketEvent event,
    Emitter<SocketState> emit,
  ) async {

    await _socketClientService.connectToSocket(
      "http://192.168.100.3:3000", // port does not matter
      handlers: {
        "echo": (data) {
          //
        },
        "joinRoom": (data) {
          debugPrint("joining room info: $data");
        },
        "room": (data) {
          debugPrint("message to the room info: $data");
          final currentState = state.copyWith();

          emit(currentState);
        },
      },
    );
  }

  void _joinToTheRoom(
    _JoinToTheRoomEventOnSocketEvent event,
    Emitter<SocketState> emit,
  ) async {
    _socketClientService.joinToRoom("room_${event.user.id}");
    emit(SocketState.initial(user: event.user));
  }

  void _sendMessage(
    _SendMessageEvemtOnSocketEvent event,
    Emitter<SocketState> emit,
  ) async {
    if (event.message.trim().isEmpty) return;
    if (state.user == null) return;

    _socketClientService.messageToRoom(event.message, "room_${state.user?.id}");
  }

  @override
  Future<void> close() {
    _socketClientService.disconnectSocket();
    return super.close();
  }
}
