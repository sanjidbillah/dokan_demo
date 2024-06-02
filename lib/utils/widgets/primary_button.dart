import 'package:dokan_demo/utils/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PrimaryButton extends StatefulWidget {
  final String title;
  const PrimaryButton({super.key, required this.title});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ThemeController.defaultFieldHeight,
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.circular(
          ThemeController.defaultFieldRadius,
        ),
      ),
      child: Center(
        child: Text(
          widget.title,
          style: Get.theme.primaryTextTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
