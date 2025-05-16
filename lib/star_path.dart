import 'dart:math';
import 'dart:ui';
import 'star.dart';

Path createStarPath(Offset center, double radius, StarShape shape, double rotationAngle) {
  final path = Path();
  int numPoints;
  final double innerRadius;
  switch (shape) {
    case StarShape.star4:
    case StarShape.star5:
    case StarShape.star6:
      final points = shape == StarShape.star4 ? 4 : shape == StarShape.star5 ? 5 : 6;
      final step = pi / points;
      for (int i = 0; i < 2 * points; i++) {
        final r = (i % 2 == 0) ? radius : radius / 2;
        final angle = i * step - pi / 2 + rotationAngle;
        final point = Offset(center.dx + r * cos(angle), center.dy + r * sin(angle));
        if (i == 0) path.moveTo(point.dx, point.dy);
        else path.lineTo(point.dx, point.dy);
      }
      path.close();
      return path;
    case StarShape.sparkle3:
      path.moveTo(center.dx, center.dy - radius);
      path.lineTo(center.dx, center.dy + radius);
      path.moveTo(center.dx - radius * 0.6, center.dy);
      path.lineTo(center.dx + radius * 0.6, center.dy);
      path.moveTo(center.dx - radius * 0.5, center.dy - radius * 0.5);
      path.lineTo(center.dx + radius * 0.5, center.dy + radius * 0.5);
      return path;
    case StarShape.sparkle4:
      path.moveTo(center.dx, center.dy - radius);
      path.lineTo(center.dx, center.dy + radius);
      path.moveTo(center.dx - radius, center.dy);
      path.lineTo(center.dx + radius, center.dy);
      path.moveTo(center.dx - radius * 0.7, center.dy - radius * 0.7);
      path.lineTo(center.dx + radius * 0.7, center.dy + radius * 0.7);
      path.moveTo(center.dx - radius * 0.7, center.dy + radius * 0.7);
      path.lineTo(center.dx + radius * 0.7, center.dy - radius * 0.7);
      return path;
    case StarShape.fivePoint:
      numPoints = 5;
      innerRadius = radius * 0.5;
      break;
    case StarShape.sixPoint:
      numPoints = 6;
      innerRadius = radius * 0.55;
      break;
    case StarShape.diamond:
      path.moveTo(center.dx, center.dy - radius);
      path.lineTo(center.dx + radius, center.dy);
      path.lineTo(center.dx, center.dy + radius);
      path.lineTo(center.dx - radius, center.dy);
      path.close();
      return path;
  }

  final double angleStep = pi / numPoints;
  for (int i = 0; i < numPoints * 2; i++) {
    final bool isEven = i % 2 == 0;
    final double r = isEven ? radius : innerRadius;
    final double angle = rotationAngle + i * angleStep;
    final x = center.dx + r * cos(angle);
    final y = center.dy + r * sin(angle);
    if (i == 0) path.moveTo(x, y);
    else path.lineTo(x, y);
  }
  path.close();
  return path;
}