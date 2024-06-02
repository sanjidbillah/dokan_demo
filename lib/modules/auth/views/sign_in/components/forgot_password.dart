import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          "Forgot Password?",
          style: Get.theme.inputDecorationTheme.hintStyle?.copyWith(
            fontSize: 13.sp,
          ),
        ),
      ).paddingOnly(bottom: 50.pt),
    );
  }
}
