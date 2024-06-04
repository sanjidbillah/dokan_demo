import 'package:dokan_demo/modules/products/controllers/product_controller.dart';
import 'package:dokan_demo/modules/products/data/data_source/product_local_data_impl.dart';
import 'package:dokan_demo/modules/products/data/data_source/product_local_data_source.dart';
import 'package:dokan_demo/modules/products/data/repository/product_repository.dart';
import 'package:dokan_demo/modules/products/data/repository/product_repository_impl.dart';
import 'package:dokan_demo/modules/root/controllers/root_controller.dart';
import 'package:get/get.dart';

class RootBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
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
