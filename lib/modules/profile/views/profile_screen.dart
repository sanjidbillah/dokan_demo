import 'package:dokan_demo/core/models/view_state.dart';
import 'package:dokan_demo/modules/profile/controllers/profile_controller.dart';
import 'package:dokan_demo/modules/profile/views/components/profile_widget.dart';
import 'package:dokan_demo/utils/widgets/app_bar.dart';
import 'package:dokan_demo/utils/widgets/on_screen_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/widgets/error_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController _profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(name: "My Account"),
      body: Center(
        child: SingleChildScrollView(
          child: Obx(() {
            if (_profileController.viewState.value == ViewState.loaded) {
              return ProfileWidget();
            } else if (_profileController.viewState.value == ViewState.error) {
              return ProjectErrorWidget(
                message: _profileController.errorMsg(),
                tryAgain: () {
                  _profileController.getProfileData();
                },
              );
            }
            return const OnScreenLoaderWidget();
          }),
        ),
      ),
    );
  }
}
