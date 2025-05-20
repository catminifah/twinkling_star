# 🌟 Twinkling Stars

A beautiful, customizable twinkling star background widget for Flutter apps.  
Supports multiple star shapes, colors, and star sizes. Perfect to decorate your UI with starry backgrounds.

---

## 🔧 Installation

Add the package to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  twinkling_stars: ^1.0.0
```
Then run:
```bash
flutter pub get
```

# ⚙️ Features

- Customizable number of stars (`starCount`)
- Option to include big stars (`includeBigStars`)
- Supports multiple star colors (`starColors`)
- Supports multiple star shapes (`starShapes`)
- Can be used with multiple widgets/screens independently
- Allows a child widget to be placed over the star background

---

# 🚀 Usage

Wrap your widget with `TwinklingStarsBackground`:

```dart
TwinklingStarsBackground(
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
    child: Container(
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
  ),
)
```

# 📚 Properties

| Property        | Type            | Description                                   |
|-----------------|-----------------|----------------------------------------------|
| starCount       | int             | Total number of stars to display              |
| includeBigStars | bool            | Whether to include some larger stars          |
| starColors      | List<Color>     | List of colors used randomly for the stars    |
| starShapes      | List<StarShape> | List of star shapes used randomly for the stars |
| child           | Widget          | Widget displayed on top of the star background |

---

# 📸 Preview

![Twinkling Stars](https://files.catbox.moe/ejo0rp.gif)

---

# 📂 Example

See the full example in the `example/main.dart` file.

---

