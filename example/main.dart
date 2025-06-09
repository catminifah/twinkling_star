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
      home: const GalaxyBlueBackground(child: StarsDemoPage(),),
    );
  }
}

class GalaxyBlueBackground extends StatelessWidget {
  final Widget child;

  const GalaxyBlueBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //-------------------------- Galaxy Blue gradient background -----------------------------------------//
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0D1B2A),
                Color(0xFF1B263B),
                Color(0xFF415A77),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        //------------------------------------ Twinkling star layer -----------------------------------------//
        TwinklingStarsBackground(
          starColors: const [Colors.white],
          starShapes: const [
            StarShape.diamond,
            StarShape.fivePoint,
            StarShape.sixPoint,
            StarShape.sparkle3,
          ],
          sizeMultiplier: 1.2,
          child: const SizedBox.expand(),
        ),
        //----------------------------------- Foreground content ------------------------------------------//
        child,
      ],
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

  //------------------------------ Widget App bar ----------------------------------------//
  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          SizedBox(
            width: 95,
            height: 40,
            child: Stack(
              children: [
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.withOpacity(0.5),
                        Colors.blueAccent.withOpacity(0.5),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        TwinklingStarsBackground(
                          starCount: 150,
                          starColors: PastelStarColor.iPastelStarColor,
                          starShapes: [
                            StarShape.diamond,
                            StarShape.fivePoint,
                            StarShape.sixPoint,
                            StarShape.sparkle3,
                            StarShape.star4,
                          ],
                          child: const SizedBox.expand(),
                        ),
                        Text(
                          'Twinkling Stars ✨',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 1,
                            wordSpacing: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Icon(Icons.help_outline, color: Colors.white70),
          SizedBox(width: 10),
          const Icon(Icons.settings, color: Colors.white70),
        ],
      ),
    );
  }
  //------------------------------ Widget App bar ----------------------------------------//
  //------------------------------ Widget Button -----------------------------------------//
  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: double.infinity,
          ),
          child: GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 80,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF4E71FF).withOpacity(0.9),
                          Color(0xFF8DD8FF).withOpacity(0.9),
                          Color(0xFFBBFBFF).withOpacity(0.9),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: TwinklingStarsBackground(
                        starColors: PastelStarColor.iPastelStarColor,
                        starShapes: [
                          StarShape.diamond,
                          StarShape.fivePoint,
                          StarShape.sixPoint,
                          StarShape.sparkle3,
                          StarShape.star4,
                        ],
                        child: const SizedBox.expand(),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'New Star',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF010A1A).withOpacity(0.9),
                            letterSpacing: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  //------------------------------ Widget Button ----------------------------------------//

}

class PastelStarColor {
  static const Color MistyRose = Color(0xFFFFE1E0);
  static const Color Mauvelous = Color(0xFFF49BAB);
  static const Color LavenderPurple = Color(0xFF9B7EBD);
  static const Color RoyalPurple = Color(0xFF7F55B1);

  static const List<Color> iPastelStarColor = [
    MistyRose,
    Mauvelous,
    LavenderPurple,
    RoyalPurple
  ];
}