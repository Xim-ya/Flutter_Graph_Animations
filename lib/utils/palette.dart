import 'package:injewelme/utils/index.dart';

/* Global Font Styles */
class FontStyles {
  FontStyles()
      : sectionTitle = const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        kcalHighLight = const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF07BC87)),
        mealTitle = const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        mealOption = const TextStyle(color: Color(0xFF878A8A), fontSize: 14);

  final TextStyle sectionTitle;
  final TextStyle kcalHighLight;
  final TextStyle mealTitle;
  final TextStyle mealOption;
}

/* Global Colors */
const kTableBorder = Color(0xFFD9D9D9);
const kPink = Color(0xFFEE7287);
