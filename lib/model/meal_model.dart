import 'package:injewelme/utils/dummy_data.dart';

class MealCore {
  List<Meal> mealList = meals; // Meal 리스트 데이터
  List<int> selectedMealList = []; // 좋아요 리스트에 추가된 Meal

  // Intent : Meal 좋아요 Toggle 메소드
  void toggleFavoriteMeal(int selectedId) {
    selectedMealList.contains(selectedId)
        ? selectedMealList.remove(selectedId)
        : selectedMealList.add(selectedId);
  }
}

class Meal {
  int id;
  int mealTime;
  String mealName;
  int mealType;
  List<String> mealIngredient;
  int gram;
  int kcal;

  Meal(this.id, this.mealTime, this.mealName, this.mealType,
      this.mealIngredient, this.gram, this.kcal);
}
