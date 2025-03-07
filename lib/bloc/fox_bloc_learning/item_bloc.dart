import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_event.dart';

part 'item_state.dart';

part 'item_bloc.freezed.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(const ItemState.initial()) {
    // don't do like this, because it's good to use without transformers
    // but when you will use transformers it may bring a lot of problems
    on<ItemEvent>((event, emit) {
      event.when(
        create: () => _onCreate(emit),
        read: () => _onRead(emit),
        update: (String value) => _onUpdate(value, emit),
        delete: () => _onDelete(emit),
      );
    }, transformer: droppable());
  }

  // Empty function for create event
  void _onCreate(Emitter<ItemState> emit) {
    // TODO: Add create logic
  }

  // Empty function for read event
  void _onRead(Emitter<ItemState> emit) {
    // TODO: Add read logic
  }

  // Empty function for update event
  void _onUpdate(String value, Emitter<ItemState> emit) {
    // TODO: Add update logic
  }

  // Empty function for delete event
  void _onDelete(Emitter<ItemState> emit) {
    // TODO: Add delete logic
  }
}
