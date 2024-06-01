import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String? message;
  const ErrorWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.images.error.path,
        ),
        Text(message ?? "Something went wrong!")
      ],
    );
  }
}
