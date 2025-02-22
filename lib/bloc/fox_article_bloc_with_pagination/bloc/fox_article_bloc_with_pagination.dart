import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_management_course/bloc/fox_article_bloc_with_pagination/models/tweet.dart';

part 'fox_article_bloc_with_pagination.freezed.dart';

@immutable
@freezed
sealed class TweetsEvent with _$TweetsEvent {
  const TweetsEvent._();

  @With<_ErrorStateEmitter>()
  @With<_ProcessingStateEmitter>()
  const factory TweetsEvent.paginate() = _Tweets$PaginateEvent;
}

mixin _ProcessingStateEmitter on TweetsEvent {
  TweetsState processing({
    required final TweetsState state,
    final String? message,
  }) =>
      TweetsState.processing(
        tweets: state.tweets,
        cursor: state.cursor,
        endOfList: state.endOfList,
        message: message ?? 'Processing',
      );
}

mixin _SuccessfulStateEmitter on TweetsEvent {
  TweetsState successful({
    required final TweetsState state,
    required final TweetChunk chunk,
    final String? message,
  }) {
    return TweetsState.successful(
      tweets: [...state.tweets, ...chunk.tweets]..sort(),
      cursor: state.cursor,
      endOfList: state.endOfList,
      message: message ?? 'Successful',
    );
  }
}

mixin _IdleStateEmitter on TweetsEvent {
  TweetsState idle({
    required final TweetsState state,
    final String? message,
  }) =>
      TweetsState.idle(
        tweets: state.tweets,
        cursor: state.cursor,
        endOfList: state.endOfList,
        message: message ?? 'Idle',
      );
}

mixin _ErrorStateEmitter on TweetsEvent {
  TweetsState error({
    required final TweetsState state,
    final String? message,
  }) =>
      TweetsState.error(
        tweets: state.tweets,
        cursor: state.cursor,
        endOfList: state.endOfList,
        message: message ?? "An error has occurred",
      );
}

@immutable
@freezed
sealed class TweetsState with _$TweetsState {
  const TweetsState._();

  const factory TweetsState.idle({
    required final List<Tweet> tweets,
    required final String? cursor,
    required final bool endOfList,
    @Default('Idle') final String message,
  }) = IdleTweetsState;

  const factory TweetsState.processing({
    required final List<Tweet> tweets,
    required final String? cursor,
    required final bool endOfList,
    @Default('Processing') final String message,
  }) = ProcessingTweetsState;

  const factory TweetsState.successful({
    required final List<Tweet> tweets,
    required final String? cursor,
    required final bool endOfList,
    @Default('Successful') final String message,
  }) = SuccessfulTweetsState;

  /// An error has occurred
  const factory TweetsState.error({
    required final List<Tweet> tweets,
    required final String? cursor,
    required final bool endOfList,
    @Default('An error has occurred') final String message,
  }) = ErrorTweetsState;

  static const TweetsState initialState = TweetsState.idle(
    tweets: <Tweet>[],
    cursor: null,
    endOfList: false,
  );

  bool get hasError => maybeMap(orElse: () => false, error: (_) => true);

  bool get isProcessing => maybeMap(orElse: () => false, processing: (_) => true);

  bool get hasMore => !endOfList;
}
