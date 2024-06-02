import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:dokan_demo/utils/themes/theme_controller.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  const SocialButton({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.pt,
      width: 55.pt,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          ThemeController.defaultFieldRadius,
        ),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(57, 90, 184, 0.1),
              blurRadius: 3,
              offset: Offset(
                0,
                2,
              ))
        ],
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          height: 22.pt,
        ),
      ),
    );
  }
}
