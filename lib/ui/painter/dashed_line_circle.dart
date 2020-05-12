import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';

class DashedLineCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = purpleColor
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Paint circlePaint = paint..style = PaintingStyle.fill;

    double maxWidth = size.width;
    double x = 0;
    double dashWidth = 4;
    double space = 12;

    canvas.drawArc(Rect.fromCircle(
        center: Offset(0, size.height / 2,), radius: size.height / 2),
        -pi / 2, 2 * pi * size.height / 2, false, circlePaint);

    while (x < maxWidth) {
      canvas.drawLine(Offset(x, size.height / 2), Offset(x + dashWidth, size.height / 2), paint);
      x += space;
    }

    canvas.drawArc(Rect.fromCircle(
        center: Offset(size.width, size.height / 2,), radius: size.height / 2),
        -pi / 2, 2 * pi * size.height / 2, false, circlePaint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}