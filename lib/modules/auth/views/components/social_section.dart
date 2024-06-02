import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../utils/widgets/social_button.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          iconPath: Assets.icons.facebook.path,
        ).paddingOnly(right: 10.pt),
        SocialButton(
          iconPath: Assets.icons.googlePng.path,
        ),
      ],
    ).paddingOnly(bottom: 40.pt);
  }
}
