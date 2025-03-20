import 'package:flutter/material.dart';

class CurvedRectanglePainter extends CustomPainter {
  Color color;

  CurvedRectanglePainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    path.quadraticBezierTo(
      size.width,
      size.height * 0.91,
      size.width * 0.92,
      size.height * 0.82,
    );

    path.quadraticBezierTo(
      size.width * 0.77,
      size.height * 0.6,
      0,
      size.height,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => true;
}
