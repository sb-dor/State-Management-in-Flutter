import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_event.freezed.dart';

@immutable
@freezed
sealed class PostEvent with _$PostEvent {
  const factory PostEvent.addText() = AddTextEvent;

  const factory PostEvent.addFile() = AddFileEvent;

  const factory PostEvent.send() = SendPostEvent;

  const factory PostEvent.delete() = DeletePostEvent;
}
