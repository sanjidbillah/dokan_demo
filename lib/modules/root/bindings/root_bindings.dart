import 'package:dokan_demo/modules/products/bindings/product_bindings.dart';
import 'package:dokan_demo/modules/profile/bindings/profile_bindings.dart';
import 'package:dokan_demo/modules/root/controllers/root_controller.dart';
import 'package:get/get.dart';

class RootBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
    ProductBindings().dependencies();
    ProfileBindings().dependencies();
  }
}
