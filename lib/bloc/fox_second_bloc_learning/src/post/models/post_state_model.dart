import 'package:flutter/foundation.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/models/post.dart';

// if you don't want to add Diagnosticable
// don't add, it help you for debugging in Flutter inspector
class PostStateModel with Diagnosticable {
  final List<Post> posts;
  final Post? post;

  const PostStateModel({
    required this.posts,
    this.post,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostStateModel &&
          runtimeType == other.runtimeType &&
          posts == other.posts &&
          post == other.post);

  @override
  int get hashCode => posts.hashCode ^ post.hashCode;

  PostStateModel copyWith({
    List<Post>? posts,
    Post? post,
  }) {
    return PostStateModel(
      posts: posts ?? this.posts,
      post: post ?? this.post,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'posts': posts,
      'post': post,
    };
  }

  factory PostStateModel.fromMap(Map<String, dynamic> map) {
    return PostStateModel(
      posts: map['posts'] as List<Post>,
      post: map['post'] as Post,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(DiagnosticsProperty<List<Post>>('posts', posts));
    properties.add(DiagnosticsProperty<Post?>('post', post));
    super.debugFillProperties(properties);
  }
}
