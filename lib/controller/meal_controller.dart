import 'package:injewelme/utils/index.dart';

class MealController extends GetxController {
  // Meal 모델과 연동
  var model = MealCore();

  MealCore _model;
  MealController({required MealCore model}) : _model = model;

  /* INSTANCE */
  Map<String, double> nutrientList = nutrients;
  List<double> nutrientsPercentage = [];
  List<String> nutrientsName = [];
  bool barAnimated = false;
  bool pieChartAnimated = false;

  List<Meal> get mealList {
    return _model.mealList;
  }

  List<int> get selectedMealList {
    return _model.selectedMealList;
  }

  // INTENTS
  // Perecetange Value를 Controller를 통해 Widget(AnimatedContainer)에 전달하여 Animation 생성
  void setProgressBarAnimation() {
    barAnimated = true;
    update();
  }

  void setPieChartAnimation() {
    pieChartAnimated = true;
    update();
  }

  void toggleFavoriteMeal(int selectedId) {
    _model.toggleFavoriteMeal(selectedId);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // Map의 각 key값과 value값을 Controller Array Instance에  저장
    nutrientList.forEach((key, value) {
      nutrientsName.add(key);
      nutrientsPercentage.add(value);
    });
  }
}
