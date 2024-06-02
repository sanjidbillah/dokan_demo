import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/auth/views/sign_in/sign_in_screen.dart';

class CheckPoint extends StatefulWidget {
  const CheckPoint({super.key});

  @override
  State<CheckPoint> createState() => _CheckPointState();
}

class _CheckPointState extends State<CheckPoint> {
  @override
  void initState() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      Get.to(() => const SignInScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.logo.path,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 0.5,
                      )).paddingOnly(right: 10),
                  const Text("Wait a moment."),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
