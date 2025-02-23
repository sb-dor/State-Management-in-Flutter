import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_management_course/bloc/fox_article_own_bloc_with_change_notifier/data/fox_article_own_bloc_with_change_notifier.dart';

part 'fox_article_own_bloc_with_change_notifier.freezed.dart';

typedef SetState<State extends Object> = void Function(State state);

abstract class Bloc<State extends Object> with ChangeNotifier {
  Bloc(State initialState) : _state = initialState;

  State get state => _state;
  State _state;

  bool get isProcessing => _isProcessing;
  bool _isProcessing = false;

  void _setState(State state) {
    _state = state;
    notifyListeners();
  }

  Future<void> handle(
    Future<void> Function(SetState<State> setState) handler,
  ) async {
    if (_isProcessing) return;

    _isProcessing = true;

    notifyListeners();

    try {
      await handler(_setState);
    } on Object {
      //Rethrow all errors to global observer,
      // and handle them in a single place
      rethrow;
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }
}

class Data {
  Data(this.id);

  int id;
}

@freezed
class SampleState with _$SampleState {
  const SampleState._();

  /// Idling state
  const factory SampleState.idle({
    required final Data? data,
    @Default('Idle') final String message,
  }) = IdleSampleState;

  /// Processing
  const factory SampleState.processing({
    required final Data? data,
    @Default('Processing') final String message,
  }) = ProcessingSampleState;

  /// Successful
  const factory SampleState.successful({
    required final Data data,
    @Default('Successful') final String message,
  }) = SuccessfulSampleState;

  /// An error has occurred
  const factory SampleState.error({
    required final Data? data,
    @Default('An error has occurred') final String message,
  }) = ErrorSampleState;

  /// Data
  @override
  Data? get data => map<Data?>(
        idle: (state) => state.data,
        processing: (state) => state.data,
        successful: (state) => state.data,
        error: (state) => state.data,
      );

  /// Has data
  bool get hasData => data != null;

  /// If an error has occurred
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  /// Is in progress state
  bool get isProcessing => maybeMap<bool>(orElse: () => false, processing: (_) => true);
}

final class FoxArticleOwnBlocWithChangeNotifier extends Bloc<SampleState> {
  FoxArticleOwnBlocWithChangeNotifier(this._iFoxArticleOwnBlocWithChangeNotifier)
      : super(
          SampleState.idle(data: Data(1)),
        );

  final IFoxArticleOwnBlocWithChangeNotifier _iFoxArticleOwnBlocWithChangeNotifier;

  Future<void> fetch({required int id}) => handle(
        (setState) async {
          try {
            setState(SampleState.processing(data: state.data));
            final newData = await _iFoxArticleOwnBlocWithChangeNotifier.data(id);
            setState(SampleState.successful(data: newData));
          } on Object {
            setState(SampleState.error(data: state.data, message: "Error occurred"));
            rethrow;
          } finally {
            setState(SampleState.idle(data: state.data));
          }
        },
      );
}
