import 'package:dokan_demo/utils/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PrimaryButton extends StatefulWidget {
  final String title;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool haveBorder;
  const PrimaryButton({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.titleColor,
    this.haveBorder = false,
  });

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
            border: widget.haveBorder
                ? Border.all(
                    color: const Color.fromRGBO(151, 151, 151, 0.67),
                    width: 0.5,
                  )
                : null),
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
