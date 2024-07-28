import 'dart:async';
import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:state_management_course/mobx/mobx_google_suggestion/model/mobx_google_suggestion_model.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

part 'mobx_google_suggestion_store.g.dart';

const googleSuggestionApi =
    "http://suggestqueries.google.com/complete/search?output=toolbar&ds=yt&q=";

class MobxGoogleSuggestionStoreData = _MobxGoogleSuggestionStore
    with _$MobxGoogleSuggestionStoreData;

abstract class _MobxGoogleSuggestionStore with Store {
  Timer? timerForRequest;

  @observable
  ObservableList<MobxGoogleSuggestionModel> suggestions =
      ObservableList<MobxGoogleSuggestionModel>();

  @observable
  bool loadingApi = false;

  @action
  Future<void> loadDataFromGoogle(String data) async {
    if ((timerForRequest?.isActive ?? false)) {
      timerForRequest?.cancel();
    }
    if (data.isEmpty) return;
    loadingApi = true;
    suggestions.clear();
    timerForRequest = Timer(const Duration(seconds: 1), () async {
      final response = await http.get(Uri.parse(googleSuggestionApi + data));
      if (response.statusCode == 200) {
        final myTransformer = Xml2Json();
        myTransformer.parse(response.body);
        final json = myTransformer.toGData();
        List suggestionsData = jsonDecode(json)['toplevel']['CompleteSuggestion'] ?? [];
        for (var suggestion in suggestionsData) {
          suggestions
              .add(MobxGoogleSuggestionModel(name: suggestion['suggestion']['data'].toString()));
        }
      }
      loadingApi = false;
    });
  }
}
