import 'package:dokan_demo/modules/profile/views/profile_screen.dart';
import 'package:dokan_demo/modules/root/controllers/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../products/views/product_list_screen.dart';
import 'components/custom_nav_bar.dart';

class RootScreen extends StatelessWidget {
  final RootController rootController = Get.find();
  RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            rootController.currentNavIndex.value = 2;
          },
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(184, 45, 72, 0.15),
                    offset: Offset(0, 12),
                    blurRadius: 28,
                    spreadRadius: 0)
              ],
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF679B),
                  Color(0xFFFF7B51),
                ],
              ),
            ),
            child: Center(child: SvgPicture.asset(Assets.icons.search)),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
