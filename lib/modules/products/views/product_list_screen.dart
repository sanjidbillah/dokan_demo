import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:dokan_demo/utils/themes/theme_controller.dart';
import 'package:dokan_demo/utils/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';
import 'components/filter.dart';
import 'components/product_list.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
        name: "Product List",
        actinWidget: [
          Padding(
            padding: EdgeInsets.only(right: ThemeController.defaultPadding),
            child: SvgPicture.asset(
              Assets.icons.search,
              // ignore: deprecated_member_use
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Filter(),
            ProductList(),
            SizedBox(
              height: 120.pt,
            )
          ],
        ).paddingSymmetric(
          horizontal: ThemeController.defaultPadding,
        ),
      ),
    );
  }
}
