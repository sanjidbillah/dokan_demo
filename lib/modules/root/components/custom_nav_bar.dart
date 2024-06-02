import 'package:dokan_demo/modules/root/controllers/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/themes/theme_controller.dart';

class _CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20);

    // Left corner curve
    path.quadraticBezierTo(0, 0, 20, 0);

    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 8);
    path.arcToPoint(Offset(size.width * 0.60, 8),
        radius: const Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    // Top straight part
    path.lineTo(size.width - 20, 0);

    // Right corner curve
    path.quadraticBezierTo(size.width, 0, size.width, 20);

    // Right side
    path.lineTo(size.width, size.height);

    // Bottom part
    path.lineTo(0, size.height);

    path.close();

    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CustomCurvedNavigationBar extends StatelessWidget {
  final rootController = Get.find<RootController>();
  CustomCurvedNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Obx(() => Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.08),
              blurRadius: 14,
              spreadRadius: 0,
              offset: Offset(
                0,
                -10,
              ),
            )
          ]),
          height: 80,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  width: size.width,
                  height: 70,
                  child: Stack(
                    children: [
                      CustomPaint(
                        painter: _CurvedPainter(),
                        size: Size(
                          size.width,
                          80,
                        ),
                      ),

                      //? floating action button

                      Center(
                        heightFactor: 0.45,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(180)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.4),
                                blurRadius: 3,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: FloatingActionButton(
                            shape: const CircleBorder(),
                            onPressed: () {},
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(139, 47, 64, 0.25),
                                    offset: Offset(0, 14),
                                    blurRadius: 23,
                                  ),
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
