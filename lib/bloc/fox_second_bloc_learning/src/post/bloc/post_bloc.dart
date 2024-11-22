import 'package:bloc/bloc.dart';
import 'post_event.dart';
import 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState.loadingText()) {
    on<PostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
