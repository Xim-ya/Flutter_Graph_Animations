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
        mealOption = const TextStyle(color: Color(0xFF878A8A), fontSize: 14),
        nutrientName = const TextStyle(color: Color(0xFF4D4D4D), fontSize: 14),
        nestedPercentageIndicator =
            const TextStyle(color: Colors.white, fontSize: 12),
        pieChartPercentageIndicator =
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  final TextStyle sectionTitle;
  final TextStyle kcalHighLight;
  final TextStyle mealTitle;
  final TextStyle mealOption;
  final TextStyle nutrientName;
  final TextStyle nestedPercentageIndicator;
  final TextStyle pieChartPercentageIndicator;
}

/* Global Colors */
const kTableBorder = Color(0xFFD9D9D9);
const kPink = Color(0xFFEE7287);
const kBarBackground = Color(0xFFF2F2F2);
const kBlue1 = Color(0xFF4C7DFE);
