import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../controllers/profile_controller.dart';
import 'dashed_circle.dart';
import 'profile_menu.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});
  final ProfileController _profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Center(
              child: CustomPaint(
                painter: DashedCirclePainter(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Image.network(
                      _profileController
                              .profileInfo?.value?.avatarUrls?.values.first ??
                          "N/A",
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Image.asset(
                            Assets.images.noImage.path,
                            height: 120.pt,
                          ),
                        );
                      },
                      fit: BoxFit.contain,
                      height: 120.pt,
                    ),
                  ),
                ),
              ).marginOnly(bottom: 20),
            ),
            Text(
              _profileController.profileInfo?.value?.name ??
                  _profileController.profileInfo?.value?.name ??
                  "N/A",
              style: Get.theme.primaryTextTheme.headlineLarge,
            ),
            const ProfileMenu(),
            const SizedBox(
              height: 100,
            )
          ],
        ));
  }
}
