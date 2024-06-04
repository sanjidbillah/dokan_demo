import 'package:dokan_demo/modules/products/data/data_source/product_local_data_impl.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import '../data/data_source/product_local_data_source.dart';
import '../data/repository/product_repository.dart';
import '../data/repository/product_repository_impl.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl(),
    );
    Get.lazyPut<ProductReposity>(
      () => ProductReposityImpl(Get.find<ProductLocalDataSource>()),
    );
    Get.lazyPut(
      () => ProductController(Get.find<ProductReposity>()),
    );
  }
}
