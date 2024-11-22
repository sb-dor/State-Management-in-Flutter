import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/bloc/post_state.dart';

part 'post_event.freezed.dart';

@immutable
@freezed
sealed class PostEvent with _$PostEvent {
  //
  // events mixins
  //
  @Implements<AddTextContainer>() // name whatever you want
  @With<InitialStateEmitter>()
  @With<AddingTextEmitter>()
  @With<HasTextEmitter>()
  @With<ErrorEmitter>()
  const factory PostEvent.addText({required final String text}) = AddTextEvent;

  const factory PostEvent.addFile({required final String path}) = AddFileEvent;

  const factory PostEvent.send() = SendPostEvent;

  const factory PostEvent.cancel() = CancelPostEvent;

  const factory PostEvent.restore() = RestorePostEvent;
}

// events mixins
// that comes with freezed package
abstract class AddTextContainer {
  String get text;
}

mixin InitialStateEmitter on PostEvent {
  PostState initial() => const PostState.initial();
}
mixin AddingTextEmitter on PostEvent {
  PostState addingText() => const PostState.addingText();
}
mixin HasTextEmitter on PostEvent implements AddTextContainer {
  PostState hasText() => PostState.hasText(text: text);
}
mixin ErrorEmitter on PostEvent implements AddTextContainer {
  PostState error({
    required PostState state,
    String? message,
  }) =>
      PostState.error(
        text: state.text,
        path: state.path,
        errorMessage: message,
      );
}
