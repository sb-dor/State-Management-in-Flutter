import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_course/flutter_riverpod/counter_riverpod/state_model/counter_state_model.dart';

import 'counter_riverpod/counter_riverpod.dart';

//
//
//create all riverPods in another file and use them.
final counterRiverPod =
    StateNotifierProvider<CounterRiverPod, CounterStateModel>((ref) => CounterRiverPod());
