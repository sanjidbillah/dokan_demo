import 'package:dokan_demo/modules/profile/views/profile_screen.dart';
import 'package:dokan_demo/modules/root/controllers/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../products/views/product_list_screen.dart';
import 'components/custom_nav_bar.dart';

class RootScreen extends StatelessWidget {
  final RootController rootController = Get.find();
  RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomCurvedNavigationBar(),
      body: Obx(() {
        if (rootController.currentNavIndex.value == 4) {
          return ProfileScreen();
        }
        return const ProductListScreen();
      }),
    );
  }
}
