import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:dokan_demo/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ud_design/ud_design.dart';

import 'utils/run_after_frame.dart';

class CheckPoint extends StatefulWidget {
  const CheckPoint({super.key});

  @override
  State<CheckPoint> createState() => _CheckPointState();
}

class _CheckPointState extends State<CheckPoint> {
  final AuthController _authController = Get.find<AuthController>();
  initilization() {
    runAfterFrame(() async {
      UdDesign.init(context);
      _authController.checkLoginStatus();
    }, delay: true);
  }

  @override
  void initState() {
    initilization();
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
