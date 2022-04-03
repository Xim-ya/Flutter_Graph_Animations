import 'package:injewelme/utils/index.dart';

class MealController extends GetxController {
  List<double> nutrientsPercentage = [];
  List<String> nutrientsName = [];
  bool barAnimated = false;

  // Perecetange Value를 Controller를 통해 Widget(Bar View)에 전달하여 Animation 생성
  void setProgressBarAnimation() {
    barAnimated = true;
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
