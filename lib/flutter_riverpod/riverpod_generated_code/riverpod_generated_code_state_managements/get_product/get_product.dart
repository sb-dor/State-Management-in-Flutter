import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management_course/flutter_riverpod/riverpod_generated_code/product_service/riverpod_product_service.dart';
import 'package:state_management_course/flutter_riverpod/riverpod_generated_code/riverpod_generated_code_state_managements/product_filter_model.dart';

part 'get_product.g.dart';

//  All providers must be annotated with @riverpod or @Riverpod().
//  This annotation can be placed on global functions or classes.
//  Through this annotation, it is possible to configure the provider.

//  When a @riverpod annotation is placed on a class, that class is called a "Notifier".
//  The class must extend _$NotifierName, where NotifierName is the class name.
//
//  Notifiers are responsible for exposing ways to modify the state of the provider.
@riverpod
class GetProduct extends _$GetProduct {
  @override
  Future<List<RiverpodProductServiceModel>> build() async {
    return await ProductService().getProducts(null);
  }

  void refreshState({ProductFilterModel? filter}) async {
    if (filter == null) {
      build();
      return;
    }
    final list = await ProductService().getProducts(filter);
    state = AsyncValue.data(list);
  }
}
