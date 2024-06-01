import 'package:dokan_demo/utils/widgets/on_screen_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

showLoader() {
  Get.dialog(
    const OnScreenLoaderWidget(),
    barrierColor: Colors.white10,
  );
}

hideLoader() {
  Get.back();
}
