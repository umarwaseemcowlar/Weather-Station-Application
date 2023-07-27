import 'package:flutter/material.dart';

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;

    final path = Path();
    const cornerRadius = 20.0; // Adjust the corner radius to your preference

    path.moveTo(0, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width, size.height);

    // Rounded corner 1
    path.lineTo(cornerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomShapePainter oldDelegate) {
    return false;
  }
}
