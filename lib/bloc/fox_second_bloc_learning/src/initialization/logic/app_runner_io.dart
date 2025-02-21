import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/authentication/widget/authentication_widget.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/initialization/logic/composition_root.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/initialization/widget/app_widget.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/initialization/widget/multi_bp_scope.dart';

class AppRunnerIo {
  Future<void> init() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    binding.deferFirstFrame();
    try {
      // init app dependencies and all necessary things here

      final compositionResult = await CompositionRoot().composeResult();

      runApp(
        MultiBlocProviderScope(
          compositionResult: compositionResult,
          child: const AppWidget(
            screen: AuthenticationWidget(),
          ),
        ),
      );
    } catch (error, stackTrace) {
      // catch problems here
      rethrow;
    } finally {
      binding.allowFirstFrame();
    }
  }
}
