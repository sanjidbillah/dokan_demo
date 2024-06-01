import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'modules/auth/views/sign_in_screen.dart';
import 'utils/widgets/on_screen_loader_widget.dart';

class CheckPoint extends StatefulWidget {
  const CheckPoint({super.key});

  @override
  State<CheckPoint> createState() => _CheckPointState();
}

class _CheckPointState extends State<CheckPoint> {
  // @override
  // void initState() {
  //   Future.delayed(
  //       Duration(
  //         seconds: 1,
  //       ), () {
  //     Get.to(() => const SignInScreen());
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OnScreenLoaderWidget(),
      ),
    );
  }
}
