import 'dart:math';
import 'dart:ui';

enum StarShape {
  star4,
  star5,
  star6,
  sparkle3,
  sparkle4,
  fivePoint,
  sixPoint,
  diamond,
}

class Star {
  final Offset position;
  final double baseRadius;
  final double baseOpacity;
  final double twinkleSpeed;
  final double rotationSpeed;
  final StarShape shapeType;
  final bool isBigStar;
  final double twinklePhase;
  final Color color;

  Star(
    this.position,
    this.baseRadius,
    this.baseOpacity,
    this.twinkleSpeed,
    this.rotationSpeed,
    this.shapeType,
    this.isBigStar,
    this.twinklePhase,
    this.color,
  );

  factory Star.random({bool isBigStar = false, required starColors, required List<StarShape> starShapes}) {
    final random = Random();

    return Star(
      Offset(random.nextDouble(), random.nextDouble()),
      isBigStar ? (random.nextDouble() * 4 + 3) : (random.nextDouble() * 2 + 0.5),
      random.nextDouble() * 0.5 + 0.3,
      random.nextDouble() * 2 + 1,
      random.nextDouble() * 2 - 1,
      starShapes[random.nextInt(starShapes.length)],
      isBigStar,
      random.nextDouble() * 2 * pi,
      starColors[random.nextInt(starColors.length)],
    );
  }
}