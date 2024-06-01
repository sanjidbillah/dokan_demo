import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:dokan_demo/utils/widgets/pumpking_heart_animation.dart';
import 'package:flutter/material.dart';

class OnScreenLoaderWidget extends StatelessWidget {
  const OnScreenLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PumpingHeart(
      image: Image.asset(
        Assets.images.logo.path,
        height: 120.pt,
      ),
    );
  }
}
