import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectErrorWidget extends StatelessWidget {
  final String? message;
  final void Function()? tryAgain;
  const ProjectErrorWidget({
    super.key,
    this.message,
    this.tryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            Assets.images.error.path,
            height: 200,
          ).marginOnly(bottom: 40),
          Text(message ?? "Something went wrong!"),
          TextButton(
            onPressed: tryAgain,
            child: Text(
              "Try again!",
              style: TextStyle(
                color: Get.theme.colorScheme.error,
              ),
            ),
          )
        ],
      ),
    );
  }
}
