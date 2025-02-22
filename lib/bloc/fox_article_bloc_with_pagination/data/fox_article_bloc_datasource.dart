import 'package:state_management_course/bloc/fox_article_bloc_with_pagination/models/tweet.dart';

abstract interface class IFoxArticleBlocDatasource {
  Future<TweetChunk> tweets();
}

final class FoxArticleBlocDatasourceImpl implements IFoxArticleBlocDatasource {
  @override
  Future<TweetChunk> tweets() async {
    return TweetChunk(
      tweets: <Tweet>[],
      cursor: "Cursor",
      hasMore: false,
    );
  }
}
