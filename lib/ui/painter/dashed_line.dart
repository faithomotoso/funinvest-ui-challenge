import 'package:flutter/material.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';

class DashedLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint()..color = purpleColor
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;

    double maxHeight = size.height;
    double y = 0;
    double dashHeight = 10;
    int space = 25;

    Path path = Path();
    path.lineTo(0, size.height);

    while (y < maxHeight) {
      canvas.drawLine(Offset(0, y), Offset(0, y + dashHeight), brush);
      y += space;
    }

    y = 0;
    while (y < maxHeight) {
      canvas.drawLine(Offset(size.width, y), Offset(size.width, y + dashHeight), brush);
      y += space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}