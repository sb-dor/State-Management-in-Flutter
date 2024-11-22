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
      transformer: sequential(),
    );
  }

  void _addText(
    AddTextEvent event,
    Emitter<PostState> emit,
  ) async {}

  void _addFile(
    AddFileEvent event,
    Emitter<PostState> state,
  ) async {}

  void _send(
    SendPostEvent event,
    Emitter<PostState> state,
  ) {}

  void _cancel(
    CancelPostEvent event,
    Emitter<PostState> state,
  ) async {}

  void _restore(
    RestorePostEvent event,
    Emitter<PostState> state,
  ) async {}
}
