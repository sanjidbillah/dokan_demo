import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewAccountButton extends StatelessWidget {
  const CreateNewAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        "Create New Account",
        style: Get.theme.primaryTextTheme.headlineMedium,
      ),
    );
  }
}
