import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryAppbar extends AppBar {
  final String name;
  final List<Widget>? actinWidget;
  PrimaryAppbar({super.key, required this.name, this.actinWidget});
  @override
  Color? get backgroundColor => Get.theme.scaffoldBackgroundColor;
  @override
  Widget? get title => Text(name);
  @override
  bool? get centerTitle => true;
  @override
  List<Widget>? get actions => actinWidget;
}
