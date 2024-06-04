import 'dart:math';

import 'package:flutter/material.dart';

class DashedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = min(size.width / 2, size.height / 2);
    final Paint paint = Paint()
      ..color = const Color(0xFFFFADAD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final Path path = Path();
    for (double i = 0; i < 360; i += 10) {
      double startAngle = i * pi / 180;
      double endAngle = (i + 5) * pi / 180;
      path.addArc(
          Rect.fromCircle(
              center: Offset(size.width / 2, size.height / 2), radius: radius),
          startAngle,
          endAngle - startAngle);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
