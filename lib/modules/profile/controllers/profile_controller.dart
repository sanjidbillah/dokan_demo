import 'package:dokan_demo/core/base/base_controller.dart';
import 'package:dokan_demo/core/models/view_state.dart';
import 'package:dokan_demo/modules/profile/data/repository/profile_data_repository.dart';
import 'package:dokan_demo/utils/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/profile_models.dart';
import '../data/models/profile_update_payload.dart';

class ProfileController extends BaseController {
  final ProfileDataRepository _profileDataRepository;
  ProfileController(this._profileDataRepository);
  Rx<ProfileModel?>? profileInfo = ProfileModel().obs;
  getProfileData() async {
    try {
      viewState.value = ViewState.loading;
      profileInfo?.value = await _profileDataRepository.getProfile();
      viewState.value = ViewState.loaded;
    } catch (e) {
      setException = e;
    }
  }

  updateProfile(ProfileUpdatePayload payload) async {
    try {
      if (profileInfo?.value?.id != null) {
        payload.id = profileInfo?.value?.id;
        showLoader();
        profileInfo?.value =
            await _profileDataRepository.updateProfile(payload);
        hideLoader();
        Get.snackbar(
          "Success",
          "Profile Updated",
          colorText: Colors.green,
        );
      }
    } catch (e) {
      setException = e;
      hideLoader();
      showErrorMsg();
    }
  }

  RxBool isAccountMenuOpen = false.obs;

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }
}
