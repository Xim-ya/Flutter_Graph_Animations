import 'package:injewelme/utils/index.dart';

/* Defaults */
const Map<int, String> mealTimeDefaults = {
  1011: "조식",
  1100: "중식",
  1101: "석식",
};

const Map<int, String> mealTypeDefaults = {
  11011: "밥류",
  11100: "국류",
  11101: "반찬류",
};

// Modeling 데이터
List<Meal> meals = [
  Meal(32421, 1011, "율무밥", 11011, ["흰쌀"], 210, 130),
  Meal(12312, 1100, "열무보리국", 11100, ["보리", "열무"], 320, 294),
  Meal(12304, 1101, "찹쌀땅콩반찬", 11101, ["찹쌀", "땅콩", "보리", "열무", "흰쌀", "김치", "된장"],
      382, 432)
];

// 다량영양소 (Nutrients List Section > Progress Bar)
const Map<String, double> nutrients = {
  "탄수화물": 24.0,
  "단백질": 65.0,
  "지방": 51.0,
  "총 식이섬유": 24.0,
  "콜레스테롤": 48.4,
  "총 포화 지방산": 48.0,
};

const List<Color> barColorHexList = [
  Color(0xFF4C7DFE),
  Color(0xFF4A98F3),
  Color(0xFF48B0E9),
  Color(0xFF45C8DF),
  Color(0xFF43E0D5),
  Color(0xFF41F9CB)
];
