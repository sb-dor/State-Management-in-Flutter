import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_state.freezed.dart';

@immutable
@freezed
sealed class PostState with _$PostState {
  const factory PostState.loadingText() = LoadingTextState;

  const factory PostState.loadingFile() = LoadingFileState;
}
