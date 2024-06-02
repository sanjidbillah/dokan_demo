import 'package:dokan_demo/modules/auth/controllers/auth_controller.dart';
import 'package:dokan_demo/modules/auth/data/data_source/auth_remote_source.dart';
import 'package:dokan_demo/modules/auth/data/data_source/auth_remote_source_impl.dart';
import 'package:dokan_demo/modules/auth/data/repository/auth_repository.dart';
import 'package:dokan_demo/modules/auth/data/repository/auth_repository_impl.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRemoteSource>(
      () => AuthRemoteSourceImpl(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(Get.find<AuthRemoteSource>()),
    );
    Get.lazyPut(
      () => AuthController(Get.find<AuthRepository>()),
    );
  }
}
