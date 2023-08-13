import 'dart:ui';
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final List<Offset> points ;

  MyPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(PointMode.points, [points[i]], paint);
      }
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}