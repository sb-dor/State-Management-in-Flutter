import 'package:state_management_course/bloc/fox_article_bloc_with_pagination/models/tweet.dart';

import 'fox_article_bloc_datasource.dart';

abstract interface class IFoxArticleBlocRepository {
  Future<TweetChunk> tweets();
}

final class FoxArticleBlocRepositoryImpl implements IFoxArticleBlocRepository {
  FoxArticleBlocRepositoryImpl(this._articleBlocDatasource);

  final IFoxArticleBlocDatasource _articleBlocDatasource;

  @override
  Future<TweetChunk> tweets() {
    // TODO: implement tweets
    throw UnimplementedError();
  }
}
