import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/data/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final IPostRepository _postRepository;

  PostBloc(this._postRepository) : super(const PostState.initial()) {
    on<PostEvent>(
      (event, emit) {
        event.map(
          addText: (addEvent) => _addText(addEvent, emit),
          addFile: (addFile) => _addFile(addFile, emit),
          send: (send) => _send(send, emit),
          // cancel: (cancel) => _cancel(cancel, emit),
          // restore: (restore) => _restore(restore, emit),
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

      await _postRepository.addText();
      // logic here
      //
      emit(event.hasText());
    } catch (error, stackTrace) {
      //
      emit(event.error(state: state));
    }
  }

  void _addFile(
    AddFileEvent event,
    Emitter<PostState> emit,
  ) async {
    try {
      event.addFile(state: state);

      // logic

      event.hasFileAndText(state: state);
    } catch (error, stackTrace) {
      //
      event.error(state: state);
    }
  }

  void _send(
    SendPostEvent event,
    Emitter<PostState> emit,
  ) {
    try {
      event.sending(state: state);

      // logic

      event.successFul(state: state);
    } catch (error, stackTrace) {
      //
      event.error(state: state);
    }
  }

// void _cancel(
//   CancelPostEvent event,
//   Emitter<PostState> emit,
// ) async {
//   try {
//     // logic
//   } catch (error, stackTrace) {
//     //
//   }
// }
//
// void _restore(
//   RestorePostEvent event,
//   Emitter<PostState> state,
// ) async {
//   try {} catch (error, stackTrace) {
//     //
//   }
// }
}
