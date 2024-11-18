part of 'item_bloc.dart';

@freezed
class ItemState with _$ItemState {
  const factory ItemState.initial() = _InitialItemState;
  const factory ItemState.loading() = _LoadingItemState;
  const factory ItemState.loaded() = _LoadedtemState;
}
