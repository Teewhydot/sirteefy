import 'package:flutter/material.dart';

class StupidQuotePainter extends CustomPainter {
  final double width;

  StupidQuotePainter(this.width);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(50, 50); // Starting point
    path.relativeLineTo(0, -50); // Up 50
    path.relativeLineTo(width * 0.6, 0); // Right
    path.relativeLineTo(0, 100); // Down 100
    path.relativeLineTo(-70, 0); // Left 70
    path.relativeLineTo(0, -50); // Up 50
    path.relativeLineTo(70, 0); // Right 70
    path.relativeLineTo(-width*0.6, 0); //
    path.relativeLineTo(0, -50); // Up 50

    canvas.drawPath(path, paint);

    // Add text content inside the custom shape
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'I am a software developer, I am not a magician, I can\'t fix stupid.',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: width * 0.6,
    );

    final offset = Offset(50, 50 - textPainter.height / 2);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



class BubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = 20.0;
    final arrowHeight = 20.0;
    final arrowWidth = 20.0;

    // Main body with rounded corners
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - radius - arrowHeight);
    path.quadraticBezierTo(size.width, size.height - arrowHeight,
        size.width - radius, size.height - arrowHeight);

    // Arrow at the bottom
    path.lineTo(arrowWidth + radius, size.height - arrowHeight);
    path.lineTo(arrowWidth, size.height);
    path.lineTo(arrowWidth, size.height - arrowHeight);

    path.lineTo(radius, size.height - arrowHeight);
    path.quadraticBezierTo(0, size.height - arrowHeight, 0,
        size.height - arrowHeight - radius);
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
