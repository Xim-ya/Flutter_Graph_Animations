import 'package:injewelme/utils/index.dart';
import 'package:injewelme/widgets/nutrient_pie_chart.dart';

class MainScreen extends StatelessWidget {
  final c = Get.put(MealController(model: MealCore()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*** Meal Table 섹션 ***/
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: c.mealList.length,
                  itemBuilder: (context, index) {
                    return MealTableItem(indexPath: index, c: c);
                  },
                ),
                /*** 다량 영양소 섹션 ***/
                nutrientsSectionTitle(), // Title
                // Progress Bar List With Animation
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: c.nutrientList.length,
                    itemBuilder: (context, index) {
                      // Progress Bar Item
                      return ProgressBarItem(
                        index: index,
                        c: c,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        pieChartDetectiveBuilder(index, c)),
                pieChartDetectiveWidget(c),
                /*** 다량 영양소 PieChart 섹션 ***/
                NutrientPieChart(c: c),
              ],
            ),
          ),
        ),
      ),
    );
  }

/* 스크롤 시 `PiceChart` 애니메이션을 보여주기 위해 SizedBox에 Detective Event값 할당  */
  VisibilityDetector pieChartDetectiveWidget(MealController c) {
    return VisibilityDetector(
        onVisibilityChanged: (VisibilityInfo info) {
          !c.pieChartAnimated ? c.setPieChartAnimation() : null;
        },
        key: const Key("pieChart"),
        child: const SizedBox(
          height: 50,
          width: 10,
        ));
  }

  /* 스크롤 시 ProgressBar의 애니메이션을 보여주기 위해 ListView의 첫 번째 separator 위젯에 Detective Event값 할당  */
  Builder pieChartDetectiveBuilder(int index, MealController c) {
    return Builder(builder: (context) {
      return index == 0
          ? VisibilityDetector(
              key: const Key("bar"),
              onVisibilityChanged: (VisibilityInfo info) {
                !c.barAnimated
                    ? c.barAnimated
                        ? null
                        : c.setProgressBarAnimation()
                    : null;
              },
              child: const SizedBox(height: 14))
          : const SizedBox(height: 14);
    });
  }

  Container nutrientsSectionTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 20),
      child: Text(
        "다량영양소",
        style: FontStyles().sectionTitle,
      ),
    );
  }
}
