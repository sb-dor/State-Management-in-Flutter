import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/models/post.dart';

part 'post_state_model.freezed.dart';

// if you don't want to add Diagnosticable
// don't add, it help you for debugging in Flutter inspector
@freezed
class PostStateModel with _$PostStateModel {
  const factory PostStateModel({required List<Post> posts, Post? post}) = _PostStateModel;

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   properties.add(DiagnosticsProperty<List<Post>>('posts', posts));
  //   properties.add(DiagnosticsProperty<Post?>('post', post));
  //   super.debugFillProperties(properties);
  // }
  // @override
  // String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
  //   final builder = DiagnosticPropertiesBuilder();
  //   debugFillProperties(builder);
  //   return builder.properties
  //       .map((property) => '${property.name}: ${property.value}')
  //       .join(', ');
  // }
}
