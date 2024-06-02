import 'package:dokan_demo/utils/themes/theme_controller.dart';
import 'package:flutter/material.dart';

extension PaddingExtensions on Widget {
  Widget get pAll => Padding(
        padding: EdgeInsets.all(ThemeController.defaultPadding),
        child: this,
      );
}
