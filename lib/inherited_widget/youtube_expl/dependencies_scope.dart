import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
final class SharedPreferencesHelper {
  //
  const SharedPreferencesHelper(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  Future<void> saveString(String key, String value) async =>
      await _sharedPreferences.setString(key, value);

  void printString(String key) => print(_sharedPreferences.getString(key));
}

@immutable
final class DependenciesContainer {
  //
  //
  const DependenciesContainer({required this.logger, required this.sharedPreferencesHelper});

  final Logger logger;

  final SharedPreferencesHelper sharedPreferencesHelper;
}

class DependenciesScope extends InheritedWidget {
  const DependenciesScope({super.key, required super.child, required this.dependenciesContainer});

  final DependenciesContainer dependenciesContainer;

  static DependenciesScope of(BuildContext context, {bool listen = true}) {
    if (listen) {
      final DependenciesScope? result =
          context.dependOnInheritedWidgetOfExactType<DependenciesScope>();
      assert(result != null, 'No _InheritedScope found in context');
      return result!;
    } else {
      final result = context.getElementForInheritedWidgetOfExactType<DependenciesScope>()?.widget;

      assert(result is DependenciesScope, 'No _InheritedScope found in context');

      return result as DependenciesScope;
    }
  }

  @override
  bool updateShouldNotify(DependenciesScope old) {
    return false;
  }
}
