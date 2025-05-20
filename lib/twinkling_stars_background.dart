import 'package:flutter/material.dart';
import 'painter.dart';
import 'star.dart';

class TwinklingStarsBackground extends StatefulWidget {
  final Widget child;
  final int starCount;
  final bool includeBigStars;
  final List<Color> starColors;
  final List<StarShape> starShapes;

  const TwinklingStarsBackground({
    super.key,
    required this.child,
    this.starCount = 100,
    this.includeBigStars = true,
    this.starColors = const [Colors.white],
    this.starShapes = const [StarShape.fivePoint],
  });

  @override
  State<TwinklingStarsBackground> createState() => _TwinklingStarsBackgroundState();
}

class _TwinklingStarsBackgroundState extends State<TwinklingStarsBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Star> _stars;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);

    _stars = List.generate(widget.starCount, (index) {
      final isBig = widget.includeBigStars && (index < widget.starCount * 0.1);
      return Star.random(
        isBigStar: isBig,
        starColors: widget.starColors,
        starShapes: widget.starShapes,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              size: size,
              painter: TwinklingStarPainter(
                _stars,
                _controller.value
              ),
            );
          },
        ),
        widget.child,
      ],
    );
  }
}