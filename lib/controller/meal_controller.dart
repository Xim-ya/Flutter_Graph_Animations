import 'package:injewelme/utils/index.dart';

class MealController extends GetxController {
  Map<String, double> nutrientList = nutrients;
  List<double> nutrientsPercentage = [];
  List<String> nutrientsName = [];
  bool barAnimated = false;
  bool pieChartAnimated = false;

  // Perecetange Value를 Controller를 통해 Widget(AnimatedContainer)에 전달하여 Animation 생성
  void setProgressBarAnimation() {
    barAnimated = true;
    update();
  }

  void setPieChartAnimation() {
    pieChartAnimated = true;
    print("UPDATED");
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
