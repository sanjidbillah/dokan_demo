import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnScreenLoaderWidget extends StatelessWidget {
  const OnScreenLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      Assets.lottie.loading,
      repeat: true,
    );
  }
}
