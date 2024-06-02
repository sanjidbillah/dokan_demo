import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:dokan_demo/utils/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageUploadSection extends StatelessWidget {
  const ImageUploadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 125.pt,
          width: 125.pt,
        ),
        Container(
          height: 121.pt,
          width: 121.pt,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: ThemeController.defaultShadow,
          ),
          child: Center(
            child: SvgPicture.asset(Assets.icons.account),
          ),
        ),
        Positioned(
          bottom: 2.pt,
          right: 2.pt,
          child: Container(
            height: 34.pt,
            width: 34.pt,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(139, 47, 64, 0.25),
                  offset: Offset(0, 14),
                  blurRadius: 23,
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF9472),
                  Color(0xFFF2709C),
                ],
              ),
            ),
            child: Center(
              child: SvgPicture.asset(Assets.icons.camera),
            ),
          ),
        )
      ],
    );
  }
}
