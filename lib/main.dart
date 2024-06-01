import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ud_design/ud_design.dart';

import 'checkpoint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    UdDesign.init(context);
    return const GetMaterialApp(
      home: CheckPoint(),
    );
  }
}
