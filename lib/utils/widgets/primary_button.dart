import 'package:dokan_demo/utils/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PrimaryButton extends StatefulWidget {
  final String title;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? titleColor;
  const PrimaryButton(
      {super.key,
      required this.title,
      this.onTap,
      this.backgroundColor,
      this.titleColor});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: ThemeController.defaultFieldHeight,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Get.theme.primaryColor,
          borderRadius: BorderRadius.circular(
            ThemeController.defaultFieldRadius,
          ),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: Get.theme.primaryTextTheme.headlineMedium?.copyWith(
              color: widget.titleColor ?? Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
