import 'package:dokan_demo/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LeftIconExpanded extends StatefulWidget {
  final String iconPath;
  final String menuName;
  final bool haveDivider;
  final Widget? expandedWidget;

  const LeftIconExpanded({
    super.key,
    required this.iconPath,
    required this.menuName,
    this.haveDivider = true,
    this.expandedWidget,
  });

  @override
  State<LeftIconExpanded> createState() => _LeftIconExpandedState();
}

class _LeftIconExpandedState extends State<LeftIconExpanded> {
  final ProfileController _profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isOpen = _profileController.isAccountMenuOpen.value;
      return InkWell(
        onTap: () {
          if (widget.expandedWidget != null) {
            _profileController.isAccountMenuOpen.value =
                !_profileController.isAccountMenuOpen.value;
          }
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(widget.iconPath).marginOnly(right: 10),
                    Text(
                      widget.menuName,
                      style: Get.theme.primaryTextTheme.headlineMedium,
                    ),
                  ],
                ),
                Icon(
                  isOpen
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.arrow_forward_ios_sharp,
                  color: const Color.fromRGBO(96, 107, 113, 1),
                )
              ],
            ),
            if (widget.expandedWidget != null && isOpen) widget.expandedWidget!,
            if (widget.haveDivider)
              const Divider(
                height: 30,
              )
          ],
        ),
      );
    });
  }
}
