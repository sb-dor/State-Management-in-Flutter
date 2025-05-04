import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:state_management_course/provider/second_project/models/cheap_datetime_model.dart';
import 'package:state_management_course/provider/second_project/models/expensive_datetime_model.dart';
import 'package:uuid/uuid.dart';

class DatetimeProvider extends ChangeNotifier {
  DatetimeProvider()
    : id = const Uuid().v4(),
      _cheapDatetimeModel = CheapDatetimeModel(),
      _expensiveDatetimeModel = ExpensiveDatetimeModel() {
    start();
  }

  late String id;
  late CheapDatetimeModel _cheapDatetimeModel;
  late ExpensiveDatetimeModel _expensiveDatetimeModel;
  late StreamSubscription _cheapDateTimeModelSubs;
  late StreamSubscription _expensiveDateTimeModelSubs;

  CheapDatetimeModel get cheapDatetimeModel => _cheapDatetimeModel;

  ExpensiveDatetimeModel get expensiveDatetimeModel => _expensiveDatetimeModel;

  StreamSubscription get cheapDateTimeModelSubs => _cheapDateTimeModelSubs;

  StreamSubscription get expensiveDateTimeModelSubs => _expensiveDateTimeModelSubs;

  void start() {
    _cheapDateTimeModelSubs = Stream.periodic(const Duration(seconds: 1)).listen((e) {
      _cheapDatetimeModel = CheapDatetimeModel();
      notifyListeners();
    });
    _expensiveDateTimeModelSubs = Stream.periodic(const Duration(seconds: 10)).listen((e) {
      _expensiveDatetimeModel = ExpensiveDatetimeModel();
      notifyListeners();
    });
  }

  void stop() {
    _cheapDateTimeModelSubs.cancel();
    _expensiveDateTimeModelSubs.cancel();
  }

  @override
  void notifyListeners() {
    id = const Uuid().v4();
    super.notifyListeners();
  }
}
