import 'dart:math';

import 'package:flutter/material.dart';
import 'star.dart';
import 'star_path.dart';

class TwinklingStarPainter extends CustomPainter {
  final List<Star> stars;
  final double animationValue;

  TwinklingStarPainter(this.stars, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (final star in stars) {
      final position = Offset(star.position.dx * size.width, star.position.dy * size.height);

      double scale = 0.5 + 0.5 *
          sin(animationValue * 2 * pi * star.twinkleSpeed + star.twinklePhase);
      double radius = star.baseRadius * scale;

      final double opacity = (star.baseOpacity +
              sin(animationValue * pi * star.twinkleSpeed + star.twinklePhase) * 0.3)
          .clamp(0, 1);

      final Paint paint = Paint()
        ..color = star.color.withOpacity(opacity)
        ..style = PaintingStyle.fill;

      final double rotationAngle = animationValue * 2 * pi * star.rotationSpeed;

      if (star.isBigStar) {
        final glowPaint = Paint()
          ..color = star.color.withOpacity(opacity * 0.4)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8);
        final glowPath = createStarPath(position, radius * 2.5, star.shapeType, rotationAngle);
        canvas.drawPath(glowPath, glowPaint);
      }

      final path = createStarPath(position, radius * 2, star.shapeType, rotationAngle);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}