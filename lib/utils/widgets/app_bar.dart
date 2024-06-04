import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:dokan_demo/utils/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PrimaryAppbar extends AppBar {
  final String name;
  PrimaryAppbar({
    super.key,
    required this.name,
  });
  @override
  Color? get backgroundColor => Get.theme.scaffoldBackgroundColor;
  @override
  Widget? get title => Text(name);
  @override
  bool? get centerTitle => true;
  @override
  List<Widget>? get actions => [
        Padding(
          padding: EdgeInsets.only(right: ThemeController.defaultPadding),
          child: SvgPicture.asset(
            Assets.icons.search,
            color: Colors.black,
          ),
        ),
      ];
}
