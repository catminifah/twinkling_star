import 'package:flutter/material.dart';
import 'package:twinkling_stars/star.dart';
import 'package:twinkling_stars/twinkling_stars_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twinkling Stars Demo',
      theme: ThemeData.dark(),
      home: const StarsDemoPage(),
    );
  }
}

class StarsDemoPage extends StatelessWidget {
  const StarsDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: TwinklingStarsBackground(
        starCount: 150,
        includeBigStars: true,
        starColors: [
          Colors.white,
          Colors.lightBlueAccent,
          Colors.amberAccent,
          Colors.pinkAccent,
        ],
        starShapes: [
          StarShape.star5,
          StarShape.diamond,
          StarShape.fivePoint,
          StarShape.sparkle4,
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Twinkling Stars ✨',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              TwinklingStarsBackground(
                starCount: 40,
                includeBigStars: false,
                starColors: [Colors.white, Colors.purpleAccent, Colors.cyanAccent],
                starShapes: [StarShape.star5, StarShape.diamond],
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Click Me ✨',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
