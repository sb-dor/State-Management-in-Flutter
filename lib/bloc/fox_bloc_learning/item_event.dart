part of 'item_bloc.dart';

@freezed
class ItemEvent with _$ItemEvent {
  const factory ItemEvent.create() = _CreateItemEvent;
  const factory ItemEvent.read() = _ReadItemEvent;
  const factory ItemEvent.update(String value) = _UpdateItemEvent;
  const factory ItemEvent.delete() = _DeleteItemEvent;
}
