import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:dokan_demo/modules/products/controllers/product_controller.dart';
import 'package:dokan_demo/modules/products/data/models/filter_model.dart.dart';
import 'package:dokan_demo/utils/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utils/themes/theme_controller.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final ProductController productController = Get.find();
        Get.bottomSheet(
          Wrap(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(ThemeController.defaultPadding),
                    width: double.infinity,
                    color: const Color(0xFFF8F8F8),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFD3DD),
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        Wrap(
                          children: [
                            Obx(() => Column(
                                  children:
                                      productController.filters.map((element) {
                                    final isActive = element.filterState ==
                                        productController.currentFilter.value;
                                    return InkWell(
                                      onTap: () {
                                        if (productController
                                                .currentFilter.value !=
                                            element.filterState) {
                                          productController.currentFilter
                                              .value = element.filterState;
                                        } else {
                                          productController.currentFilter
                                              .value = FilterState.none;
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: isActive
                                                  ? const Color(0xFFFF708A)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              border: isActive
                                                  ? null
                                                  : Border.all(
                                                      color: const Color(
                                                          0xFFFF708A),
                                                    ),
                                            ),
                                            child: isActive
                                                ? const Center(
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 13,
                                                    ),
                                                  )
                                                : null,
                                          ).marginOnly(right: 8),
                                          Text(element.name)
                                        ],
                                      ).marginOnly(bottom: 8),
                                    );
                                  }).toList(),
                                ))
                          ],
                        ).marginOnly(bottom: 40),
                        Row(
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                backgroundColor: Colors.white,
                                title: "Cancel",
                                titleColor: const Color(0xFF818995),
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: PrimaryButton(
                                backgroundColor: const Color(0xFF1ABC9C),
                                title: "Apply",
                                onTap: () {
                                  Get.back();
                                  productController.filterProduct();
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      child: Container(
        height: ThemeController.defaultFieldHeight,
        padding: EdgeInsets.symmetric(
          horizontal: ThemeController.defaultPadding,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            ThemeController.defaultFieldRadius,
          ),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(57, 90, 184, 0.1),
                blurRadius: 4,
                offset: Offset(
                  0,
                  3,
                ))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(Assets.icons.filter).marginOnly(right: 10),
                Text(
                  "Filter",
                  style: Get.theme.dropdownMenuTheme.textStyle,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Sort By",
                  style: Get.theme.dropdownMenuTheme.textStyle,
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Get.theme.dropdownMenuTheme.textStyle?.color,
                ),
                SvgPicture.asset(Assets.icons.sort),
              ],
            )
          ],
        ),
      ),
    );
  }
}
