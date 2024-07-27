import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management_course/flutter_riverpod/riverpod_generated_code/riverpod_generated_code_state_managements/get_product/get_product.dart';
import 'package:state_management_course/flutter_riverpod/riverpod_generated_code/riverpod_generated_code_state_managements/product_filter_model.dart';

part 'riverpod_product_filter.g.dart';

//  All providers must be annotated with @riverpod or @Riverpod().
//  This annotation can be placed on global functions or classes.
//  Through this annotation, it is possible to configure the provider.

//  When a @riverpod annotation is placed on a class, that class is called a "Notifier".
//  The class must extend _$NotifierName, where NotifierName is the class name.
//
//  Notifiers are responsible for exposing ways to modify the state of the provider.
@riverpod
class RiverpodProductFilter extends _$RiverpodProductFilter {
  @override
  ProductFilterModel build() {
    return ProductFilterModel.initial();
  }

  void updateState(ProductFilterModel model) {
    debugPrint("coming here update");
    state = model;
    ref.read(getProductProvider.notifier).refreshState(filter: model);
  }
}
