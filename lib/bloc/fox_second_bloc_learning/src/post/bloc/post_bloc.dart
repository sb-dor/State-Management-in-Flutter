import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/data/post_repository.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/models/post.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final IPostRepository _postRepository;

  PostBloc({
    required IPostRepository postRepository,
    required PostState initialState,
  })  : _postRepository = postRepository,
        super(initialState) {
    // NOTE!
    // if you want to use transformers with freezed
    // the best solution for transformer is "concurrent()"
    // but you have to created getters for each state (optional, one is enough)
    // in order to check whether specific state is working and you can not to emit particular
    // state again while it's in precess (you can call other events at that time)

    // EDITED!
    // after learning specific articles from Fox and Michael Lazebny, I want to change opinion about
    // using "concurrent" transformer, it's better to use only one "on" handler with "sequential"
    // transformer, because every event inside "on" handler will be executed only after one of them finishes
    //
    on<PostEvent>(
      /// NOTE! when you want to create events with freezed
      /// register all events like I'm doing below
      /// especially:  [(event, emit) => event.map]
      (event, emit) => event.map(
        addText: (addEvent) => _addText(addEvent, emit),
        addFile: (addFile) => _addFile(addFile, emit),
        send: (send) => _send(send, emit),
        addPost: (addPost) => _addPost(addPost, emit),
        checkEventTest: (event) => _checkTestEvent(event, emit),
      ),
      transformer: sequential(),
    );
    // on<AddPost>(_addPost);
  }

  void _addText(
    AddTextEvent event,
    Emitter<PostState> emit,
  ) async {
    try {
      // emit(event.addingText());

      await _postRepository.addText();
      // logic here
      //
      // emit(event.hasText());
    } catch (error) {
      //
      // emit(event.error(state: state));
    }
  }

  void _addFile(
    AddFileEvent event,
    Emitter<PostState> emit,
  ) async {
    try {
      // event.addFile(state: state);

      // logic

      // event.hasFileAndText(state: state);
    } catch (error) {
      //
      // event.error(state: state);
    }
  }

  void _send(
    SendPostEvent event,
    Emitter<PostState> emit,
  ) async {
    try {
      // event.sending(state: state);

      // logic

      // event.successFul(state: state);
    } catch (error) {
      //
      // event.error(state: state);
    }
  }

  void _addPost(
    AddPost event,
    Emitter<PostState> emit,
  ) async {
    try {
      if (state.isSending) return;

      print('working adding post');

      emit(event.sending(state: state));

      final savePost = await _postRepository.savePost();

      if (savePost) {
        final listFromCopiedList = List<Post>.from(state.postStateModel.posts);

        listFromCopiedList.add(event.post);

        final copiedState = state.postStateModel.copyWith(
          posts: listFromCopiedList,
        );

        emit(PostSuccessfulState(copiedState));
      } else {
        emit(event.sendError(state: state));
      }
      //
    } catch (error) {
      debugPrint("add post error: $error");
      //
      emit(event.error(state: state, message: error.toString()));
    }
  }

  void _checkTestEvent(
    CheckTestEvent event,
    Emitter<PostState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    print('checking event whether it works at the same time with other events');
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
