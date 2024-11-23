import 'package:state_management_course/bloc/fox_second_bloc_learning/src/post/data/post_datasource.dart';

abstract interface class IPostRepository {
  Future<void> savePost();

  Future<void> addText();
}

class PostRepositoryImpl implements IPostRepository {
  final IPostDatasource _postDatasource;

  PostRepositoryImpl(this._postDatasource);

  @override
  Future<void> savePost() => _postDatasource.savePost();

  @override
  Future<void> addText() {
    // TODO: implement addText
    throw UnimplementedError();
  }
}