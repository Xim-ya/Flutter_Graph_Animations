import 'package:injewelme/utils/index.dart';
import 'package:injewelme/widgets/nutrient_pie_chart.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(MealController());
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
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return MealTableItem(indexPath: index);
                  },
                ),

                /*** 다량 영양소 섹션 ***/
                // Title
                nutrientsSectionTitle(),
                // Progress Bar List With Animation

                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: nutrients.length,
                    itemBuilder: (context, index) {
                      // Progress Bar Item
                      return ProgressBarItem(
                        index: index,
                        c: c,
                      );
                    },
                    /* 스크롤 시 ProgressBar의 애니메이션을 보여주기 위해 ListView의 첫 번째 separator 위젯에 Detect Event값을 할당  */
                    separatorBuilder: (BuildContext context, int index) =>
                        index == 0
                            ? VisibilityDetector(
                                key: const Key("bar"),
                                onVisibilityChanged: (VisibilityInfo info) {
                                  c.barAnimated
                                      ? null
                                      : c.setProgressBarAnimation();
                                },
                                child: const SizedBox(height: 14))
                            : const SizedBox(height: 14)),
                VisibilityDetector(
                    onVisibilityChanged: (VisibilityInfo info) {
                      c.setPieChartAnimation();
                    },
                    key: const Key("pieChart"),
                    child: const SizedBox(
                      height: 50,
                      width: 10,
                    )),
                /*** 다량 영양소 PieChart Section ***/
                NutrientPieChart(c: c),
              ],
            ),
          ),
        ),
      ),
    );
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
