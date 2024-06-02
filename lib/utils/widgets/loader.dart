import 'package:dokan_demo/utils/themes/theme_controller.dart';
import 'package:dokan_demo/utils/widgets/on_screen_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

showLoader() {
  Get.closeAllSnackbars();
  hideLoader();
  Get.dialog(
    Container(
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(
            ThemeController.defaultFieldRadius,
          ),
        ),
        child: const OnScreenLoaderWidget()),
    barrierColor: Colors.white54,
    barrierDismissible: false,
  );
}

hideLoader() {
  if (Get.isDialogOpen ?? false) {
    Get.back();
  }
}
