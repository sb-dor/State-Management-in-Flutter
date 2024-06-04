import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class BlocEventStates extends Equatable {}

@immutable
class LoadingBlocTestState extends BlocEventStates {
  @override
  List<Object?> get props => [];
}

@immutable
class ErrorBlocTestState extends BlocEventStates {
  @override
  List<Object?> get props => [];
}

@immutable
class LoadedBlocTestState extends BlocEventStates {
  @override
  List<Object?> get props => [];
}
