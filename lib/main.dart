import 'package:dokan_demo/utils/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:ud_design/ud_design.dart';

import 'checkpoint.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController _themeController = ThemeController();
  @override
  Widget build(BuildContext context) {
    UdDesign.init(context);
    return GetMaterialApp(
      home: const CheckPoint(),
      theme: _themeController.lightTheme,
      themeMode: _themeController.themeMode,
    );
  }
}
