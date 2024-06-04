import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:dokan_demo/utils/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ud_design/ud_design.dart';

import '../../controllers/product_controller.dart';
import 'star_ratting.dart';

class ProductList extends StatelessWidget {
  final _productController = Get.find<ProductController>();

  ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 20.pt),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: _productController.products.length,
        itemBuilder: (_, index) {
          final item = _productController.products[index];
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  ThemeController.defaultFieldRadius,
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(77, 88, 119, 0.13),
                      blurRadius: 6,
                      offset: Offset(2, 3))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 165.pt,
                  width: UdDesign.screenWidth,
                  decoration: BoxDecoration(
                    color: const Color(0xFFECD8D8).withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          ThemeController.defaultFieldRadius,
                        ),
                        topRight: Radius.circular(
                          ThemeController.defaultFieldRadius,
                        )),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          ThemeController.defaultFieldRadius,
                        ),
                        topRight: Radius.circular(
                          ThemeController.defaultFieldRadius,
                        )),
                    child: Image.network(
                      item.images?[0].src ?? "N/A",
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Image.asset(
                            Assets.images.noImage.path,
                            height: 50.pt,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.pt),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35.pt,
                        child: Text(
                          item.name ?? "N/A",
                          style: Get.theme.primaryTextTheme.headlineSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          if (item.regularPrice != item.price)
                            Text(
                              "\$${item.regularPrice}",
                              style: Get.theme.inputDecorationTheme.hintStyle
                                  ?.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Get
                                          .theme
                                          .inputDecorationTheme
                                          .hintStyle
                                          ?.color),
                            ).paddingOnly(right: 5),
                          Text(
                            "\$${item.price}",
                            style: Get.theme.primaryTextTheme.headlineLarge,
                          ),
                        ],
                      ),
                      StarRating(
                        averageRating:
                            double.parse(item.averageRating ?? "0.0"),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
