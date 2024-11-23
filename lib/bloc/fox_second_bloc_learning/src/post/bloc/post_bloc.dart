import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState.initial()) {
    on<PostEvent>(
      (event, emit) {
        event.map(
          addText: (addEvent) => _addText(addEvent, emit),
          addFile: (addFile) => _addFile(addFile, emit),
          send: (send) => _send(send, emit),
          cancel: (cancel) => _cancel(cancel, emit),
          restore: (restore) => _restore(restore, emit),
        );
      },
      transformer: droppable(),
    );
  }

  void _addText(
    AddTextEvent event,
    Emitter<PostState> emit,
  ) async {
    try {
      emit(event.addingText());
      // logic here
      //
      emit(event.hasText());
    } catch (error, stackTrace) {
      //
    }
  }

  void _addFile(
    AddFileEvent event,
    Emitter<PostState> state,
  ) async {
    try {} catch (error, stackTrace) {
      //
    }
  }

  void _send(
    SendPostEvent event,
    Emitter<PostState> state,
  ) {
    try {} catch (error, stackTrace) {
      //
    }
  }

  void _cancel(
    CancelPostEvent event,
    Emitter<PostState> state,
  ) async {
    try {} catch (error, stackTrace) {
      //
    }
  }

  void _restore(
    RestorePostEvent event,
    Emitter<PostState> state,
  ) async {
    try {} catch (error, stackTrace) {
      //
    }
  }
}
