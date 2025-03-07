typedef TweetId = String;

// create abstract class
// think that there is a class Tweet which was created
// this is just a draft
abstract class Tweet implements Comparable<Tweet> {
  abstract final TweetId tweetId;

  factory Tweet.fromJson(Map<String, Object?> json) =>
      throw UnimplementedError();

  Map<String, Object?> toJson();

  @override
  int compareTo(Tweet other) {
    return tweetId.compareTo(other.tweetId);
  }
}

// class that state will be inside states
// for handling list, bool
class TweetChunk {
  TweetChunk({
    required this.tweets,
    required this.cursor,
    required this.hasMore,
  });

  final List<Tweet> tweets;
  final String? cursor;
  final bool hasMore;
}
