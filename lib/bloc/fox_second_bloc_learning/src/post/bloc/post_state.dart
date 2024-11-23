import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_state.freezed.dart';

@immutable
@freezed
sealed class PostState with _$PostState {
  const PostState._();

  //
  String? get path => when(
        initial: () => null,
        hasText: (text) => null,
        addingText: () => null,
        addingFile: (text) => null,
        hasFileAndText: (_, path) => path,
        sending: (_, path) => path,
        error: (_, path, __) => path,
        successful: (_, path) => path,
      );

  //
  String? get text => when(
        initial: () => null,
        hasText: (text) => text,
        addingText: () => null,
        addingFile: (text) => text,
        hasFileAndText: (text, _) => text,
        sending: (text, _) => text,
        error: (text, _, __) => text,
        successful: (text, _) => text,
      );

  bool get isProcessing => map(
        initial: (_) => false,
        hasText: (_) => false,
        addingText: (_) => true,
        addingFile: (_) => true,
        hasFileAndText: (_) => false,
        sending: (_) => true,
        error: (_) => true,
        successful: (_) => false,
      );

  const factory PostState.initial() = LoadingTextState;

  const factory PostState.hasText({required final String text}) = HasTextState;

  const factory PostState.addingText() = AddingTextState;

  const factory PostState.addingFile({required final String text}) = AddingFileState;

  const factory PostState.hasFileAndText({
    required final String text,
    required final String path,
  }) = HasFileAndTextState;

  const factory PostState.sending({
    required final String text,
    required final String path,
  }) = SendingState;

  const factory PostState.error({
    @Default("") String? text,
    @Default("") String? path,
    @Default("Произошла ошибка") String? errorMessage,
  }) = PostErrorState;

  const factory PostState.successful({
    required final String text,
    required final String path,
  }) = PostSuccessfulState;
}
