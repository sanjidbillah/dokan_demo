import 'package:dokan_demo/modules/profile/controllers/profile_controller.dart';
import 'package:dokan_demo/modules/profile/data/data_source/profile_data_remote_source.dart';
import 'package:dokan_demo/modules/profile/data/data_source/profile_data_remote_srouce_impl.dart';
import 'package:dokan_demo/modules/profile/data/repository/profile_data_repository.dart';
import 'package:dokan_demo/modules/profile/data/repository/profile_data_repository_impl.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileDataRemoteSource>(
      () => ProfileDataRemoteSourceImpl(),
    );
    Get.lazyPut<ProfileDataRepository>(
      () => ProfileDataRepositoryImpl(Get.find<ProfileDataRemoteSource>()),
    );
    Get.lazyPut(
      () => ProfileController(Get.find<ProfileDataRepository>()),
    );
  }
}
