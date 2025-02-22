import 'package:state_management_course/bloc/fox_article_own_bloc_with_change_notifier/bloc/fox_article_own_bloc_with_change_notifier.dart';

abstract interface class IFoxArticleOwnBlocWithChangeNotifier {
  Future<Data> data(int id);
}

// temp instead of creating datasource
final class FoxArticleOwnBlocWithChangeNotifierImpl
    implements IFoxArticleOwnBlocWithChangeNotifier {
  @override
  Future<Data> data(int id) async {
    final tempId = id + 1;
    return Data(tempId);
  }
}
