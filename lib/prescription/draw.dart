import 'package:flutter/material.dart';

class Draw extends StatefulWidget {
  const Draw({Key? key}) : super(key: key);

  @override
  State<Draw> createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  final List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            points.add(details.localPosition);
          });
        },
        onPanEnd: (_) {
          points.add(null); // To separate segments in the paint path
        },
        child: Container(
        width: 300,
        height: 300,
          child: CustomPaint(
          painter: MyPainter(points: points.map((offset) => offset ?? Offset(0,0)).toList()),
        ),
        ),
      )
    );
  }
}

class MyPainter extends CustomPainter {
  // Implement your drawing logic here
  List<Offset> points = [];
  MyPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}