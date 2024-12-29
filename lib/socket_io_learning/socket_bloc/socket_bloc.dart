import 'dart:convert';

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

  const factory SocketEvent.leaveRoom() = _LeaveRoomEventOnSocketEvent;

  const factory SocketEvent.sendMessage(String message) = _SendMessageEvemtOnSocketEvent;

  const factory SocketEvent.handleMessage(dynamic data) = _HandleMessagesEventOnSocketEvent;
}

@freezed
sealed class SocketState with _$SocketState {
  const factory SocketState.initial() = Initial;

  const factory SocketState.completed({
    required User toUser,
    required List<String> messages,
  }) = CompletedStateOnSocketStates;
}

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  final SocketClientService _socketClientService;

  SocketBloc(this._socketClientService) : super(const SocketState.initial()) {
    on<SocketEvent>(
      (event, emit) => event.map(
        initialEvent: (event) => _init(event, emit),
        joinToTheRoom: (event) => _joinToTheRoom(event, emit),
        leaveRoom: (event) => _leaveRoom(event, emit),
        sendMessage: (event) => _sendMessage(event, emit),
        handleMessage: (event) => _handleMessages(event, emit),
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
          add(SocketEvent.handleMessage(data));
        },
      },
    );
  }

  void _joinToTheRoom(
    _JoinToTheRoomEventOnSocketEvent event,
    Emitter<SocketState> emit,
  ) async {
    _socketClientService.joinToRoom("room_${event.user.id}");
    emit(
      SocketState.completed(toUser: event.user, messages: <String>[]),
    );
  }

  void _leaveRoom(
    _LeaveRoomEventOnSocketEvent event,
    Emitter<SocketState> emit,
  ) async {
    if (state is! CompletedStateOnSocketStates) return;
    final currentState = state as CompletedStateOnSocketStates;
    _socketClientService.leaveTheRoom("room_${currentState.toUser.id}");
    emit(const SocketState.initial());
  }

  void _sendMessage(
    _SendMessageEvemtOnSocketEvent event,
    Emitter<SocketState> emit,
  ) async {
    if (state is! CompletedStateOnSocketStates) return;
    final currentState = state as CompletedStateOnSocketStates;
    if (event.message.trim().isEmpty) return;

    _socketClientService.messageToRoom(
      jsonEncode({
        "message": event.message,
        "user_id": currentState.toUser.id,
      }),
      "room_${currentState.toUser.id}",
    );
  }

  void _handleMessages(
    _HandleMessagesEventOnSocketEvent event,
    Emitter<SocketState> emit,
  ) async {
    if (state is! CompletedStateOnSocketStates) return;
    var currentState = state as CompletedStateOnSocketStates;

    Map<String, dynamic> decodedData =
        event.data is Map<String, dynamic> ? event.data : jsonDecode(event.data);

    debugPrint("decoded data: $decodedData");

    if (decodedData.containsKey('user_id') && decodedData['user_id'] == currentState.toUser.id) {
      List<String> stateMessages = List<String>.from(currentState.messages);
      stateMessages.add("${decodedData['message']}");
      currentState = currentState.copyWith(
        messages: stateMessages,
      );
      debugPrint("adding messagesssss");
    }

    emit(currentState);
  }

  @override
  Future<void> close() {
    _socketClientService.disconnectSocket();
    return super.close();
  }
}
