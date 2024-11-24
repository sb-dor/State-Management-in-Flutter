import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/models/post_state_model.dart';

part 'post_state.freezed.dart';

@immutable
@freezed
sealed class PostState with _$PostState {
  const PostState._();
  //
  // String? get path => when(
  //       initial: () => null,
  //       hasText: (text) => null,
  //       addingText: () => null,
  //       addingFile: (text) => null,
  //       hasFileAndText: (_, path) => path,
  //       sending: (_, path) => path,
  //       error: (_, path, __) => path,
  //       successful: (_, path) => path,
  //     );
  //
  // //
  // String? get text => when(
  //       initial: () => null,
  //       hasText: (text) => text,
  //       addingText: () => null,
  //       addingFile: (text) => text,
  //       hasFileAndText: (text, _) => text,
  //       sending: (text, _) => text,
  //       error: (text, _, __) => text,
  //       successful: (text, _) => text,
  //     );

  bool get isSending => maybeMap(orElse: () => false, sending: (_) => true);

  const factory PostState.initial(PostStateModel postStateModel) = LoadingTextState;

  const factory PostState.hasText(PostStateModel postStateModel) = HasTextState;

  const factory PostState.addingText(PostStateModel postStateModel) = AddingTextState;

  const factory PostState.addingFile(PostStateModel postStateModel) = AddingFileState;

  const factory PostState.hasFileAndText(PostStateModel postStateModel) = HasFileAndTextState;

  const factory PostState.sending(PostStateModel postStateModel) = SendingState;

  const factory PostState.sendError(PostStateModel postStateModel) = SendErrorState;

  const factory PostState.error(
    PostStateModel postStateModel, {
    @Default("Произошла ошибка") String? errorMessage,
  }) = PostErrorState;

  const factory PostState.successful(PostStateModel postStateModel) = PostSuccessfulState;
}
