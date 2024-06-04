import 'package:dokan_demo/modules/root/controllers/root_controller.dart';
import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/themes/theme_controller.dart';

class _CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5889067, size.height * 0.3198462);
    path_0.cubicTo(
        size.width * 0.5744667,
        size.height * 0.4724981,
        size.width * 0.5468747,
        size.height * 0.6057692,
        size.width * 0.5010800,
        size.height * 0.6057692);
    path_0.cubicTo(
        size.width * 0.4566960,
        size.height * 0.6057692,
        size.width * 0.4266667,
        size.height * 0.4759615,
        size.width * 0.4137520,
        size.height * 0.3346010);
    path_0.cubicTo(
        size.width * 0.4066667,
        size.height * 0.2740385,
        size.width * 0.3866667,
        size.height * 0.006141077,
        size.width * 0.3373333,
        size.height * 0.006141077);
    path_0.lineTo(size.width * 0.02777787, size.height * 0.006141077);
    path_0.cubicTo(size.width * 0.01243653, size.height * 0.006141077, 0,
        size.height * 0.05098433, 0, size.height * 0.1063010);
    path_0.lineTo(0, size.height * 0.9929231);
    path_0.lineTo(size.width, size.height * 0.9929231);
    path_0.lineTo(size.width, size.height * 0.1063010);
    path_0.cubicTo(
        size.width,
        size.height * 0.05098433,
        size.width * 0.9875627,
        size.height * 0.006141077,
        size.width * 0.9722213,
        size.height * 0.006141077);
    path_0.lineTo(size.width * 0.6706667, size.height * 0.006141077);
    path_0.cubicTo(
        size.width * 0.6253333,
        size.height * 0.006141077,
        size.width * 0.5973333,
        size.height * 0.2307692,
        size.width * 0.5889067,
        size.height * 0.3198462);

    path_0.close();
    // Draw the shadow
    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.08)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    canvas.drawPath(path_0.shift(const Offset(0, -10)), shadowPaint);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomCurvedNavigationBar extends StatelessWidget {
  final rootController = Get.find<RootController>();
  CustomCurvedNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Obx(() => SizedBox(
          height: 90.pt,
          child: Stack(
            children: [
              Positioned(
                bottom: -1,
                left: 0,
                child: SizedBox(
                  width: size.width,
                  height: 71, // Adjusted to remove the tiny gap
                  child: Stack(
                    children: [
                      CustomPaint(
                        painter: _CurvedPainter(),
                        size: Size(
                          size.width,
                          80,
                        ),
                      ),

                      Center(
                        heightFactor: 0.30,
                        child: FloatingActionButton(
                          shape: const CircleBorder(),
                          onPressed: () {},
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(184, 45, 72, 0.15),
                                    offset: Offset(0, 12),
                                    blurRadius: 28,
                                    spreadRadius: 0)
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFF679B),
                                  Color(0xFFFF7B51),
                                ],
                              ),
                            ),
                            child: Center(
                                child: SvgPicture.asset(Assets.icons.search)),
                          ),
                        ),
                      ),

                      //? icons

                      SizedBox(
                        height: 90,
                        // width: size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ThemeController.defaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                  Assets.icons.home,
                                  // ignore: deprecated_member_use
                                  color:
                                      rootController.currentNavIndex.value == 0
                                          ? Get.theme.bottomNavigationBarTheme
                                              .selectedItemColor
                                          : null,
                                ),
                                onPressed: () {
                                  rootController.currentNavIndex.value = 0;
                                },
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                  Assets.icons.category,

                                  // ignore: deprecated_member_use
                                  color:
                                      rootController.currentNavIndex.value == 1
                                          ? Get.theme.bottomNavigationBarTheme
                                              .selectedItemColor
                                          : null,
                                ),
                                onPressed: () {
                                  rootController.currentNavIndex.value = 1;
                                },
                              ),
                              SizedBox(
                                width: size.width * 0.20,
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                  Assets.icons.cart,
                                  // ignore: deprecated_member_use
                                  color:
                                      rootController.currentNavIndex.value == 3
                                          ? Get.theme.bottomNavigationBarTheme
                                              .selectedItemColor
                                          : null,
                                ),
                                onPressed: () {
                                  rootController.currentNavIndex.value = 3;
                                },
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                  Assets.icons.personNav,
                                  // ignore: deprecated_member_use
                                  color:
                                      rootController.currentNavIndex.value == 4
                                          ? Get.theme.bottomNavigationBarTheme
                                              .selectedItemColor
                                          : null,
                                ),
                                onPressed: () {
                                  rootController.currentNavIndex.value = 4;
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
