import 'package:injewelme/utils/index.dart';

class ProgressBarItem extends StatelessWidget {
  final int index;
  final MealController c;

  const ProgressBarItem({Key? key, required this.c, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Percentage Bar Width == deviceWidth - 32(horizonP) - 60 (percentage Indicator)
    final double valuableBarWidth = MediaQuery.of(context).size.width - 92;
    final percentage = c.nutrientsPercentage[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nutrient Name
        nutrientName(),
        // Progress Bar & Percentage Indicator
        Row(
          children: [
            Expanded(
              child: progressBar(valuableBarWidth, percentage),
            ),
            percentageIndicator()
          ],
        ),
      ],
    );
  }

  Container percentageIndicator() {
    return Container(
        alignment: Alignment.center, width: 60, child: const Text("100%"));
  }

  Stack progressBar(double valuableBarWidth, double percentage) {
    return Stack(
      children: [
        // Background Bar
        Container(
          height: 18,
          width: double.infinity,
          color: kBarBackground,
        ),
        GetBuilder<MealController>(
            init: c,
            builder: (context) {
              final double barWidth = valuableBarWidth * percentage / 100;
              return Stack(clipBehavior: Clip.none, children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: Alignment.centerRight,
                  color: barColorHexList[index],
                  height: 18,
                  width: c.barAnimated ? barWidth : 0,
                ),
                Positioned(
                  right: barWidth > 26
                      ? 6
                      : -26, // Active Bar 사이즈에 따라 Indicator 위치 변경
                  child: Container(
                    alignment: Alignment.center,
                    height: 18,
                    child: Text(
                        "${percentage % 1 == 0 ? percentage.toInt() : percentage}%", // 소숫점 변환
                        style: FontStyles().nestedPercentageIndicator),
                  ),
                ),
              ]);
            }),
      ],
    );
  }

  Container nutrientName() {
    return Container(
        margin: const EdgeInsets.only(bottom: 6),
        child: Text(c.nutrientsName[index], style: FontStyles().nutrientName));
  }
}
