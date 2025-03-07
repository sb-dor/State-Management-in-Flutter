// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_google_suggestion_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxGoogleSuggestionStoreData on _MobxGoogleSuggestionStore, Store {
  late final _$suggestionsAtom = Atom(
    name: '_MobxGoogleSuggestionStore.suggestions',
    context: context,
  );

  @override
  ObservableList<MobxGoogleSuggestionModel> get suggestions {
    _$suggestionsAtom.reportRead();
    return super.suggestions;
  }

  @override
  set suggestions(ObservableList<MobxGoogleSuggestionModel> value) {
    _$suggestionsAtom.reportWrite(value, super.suggestions, () {
      super.suggestions = value;
    });
  }

  late final _$loadingApiAtom = Atom(
    name: '_MobxGoogleSuggestionStore.loadingApi',
    context: context,
  );

  @override
  bool get loadingApi {
    _$loadingApiAtom.reportRead();
    return super.loadingApi;
  }

  @override
  set loadingApi(bool value) {
    _$loadingApiAtom.reportWrite(value, super.loadingApi, () {
      super.loadingApi = value;
    });
  }

  late final _$loadDataFromGoogleAsyncAction = AsyncAction(
    '_MobxGoogleSuggestionStore.loadDataFromGoogle',
    context: context,
  );

  @override
  Future<void> loadDataFromGoogle(String data) {
    return _$loadDataFromGoogleAsyncAction.run(
      () => super.loadDataFromGoogle(data),
    );
  }

  @override
  String toString() {
    return '''
suggestions: ${suggestions},
loadingApi: ${loadingApi}
    ''';
  }
}
