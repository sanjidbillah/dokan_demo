import 'package:flutter/material.dart';

import '../products/views/product_list_screen.dart';
import 'components/custom_nav_bar.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomCurvedNavigationBar(),
      body: const ProductListScreen(),
    );
  }
}
