import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/initialization/logic/composition_root.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/initialization/widget/app_widget.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/initialization/widget/main_screen.dart';
import 'package:state_management_course/bloc/fox_second_bloc_learning/src/initialization/widget/multi_bp_helper.dart';

class AppRunnerIo {
  Future<void> init() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    binding.deferFirstFrame();

    // init app dependencies and all necessary things here

    final compositionResult = await CompositionRoot().composeResult();

    runApp(
      MultiBlocProviderHelper(
        compositionResult: compositionResult,
        child: const AppWidget(
          screen: MainScreen(),
        ),
      ),
    );
  }
}
