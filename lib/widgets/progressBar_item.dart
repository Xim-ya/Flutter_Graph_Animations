import 'package:injewelme/utils/index.dart';

class ProgressBarItem extends StatelessWidget {
  final String nutrientName;
  final double percentage;
  final int hexColor;

  const ProgressBarItem(
      {Key? key,
      required this.nutrientName,
      required this.percentage,
      required this.hexColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Percentage Bar Width == deviceWidth - 32(horizonP) - 60 (percentage Indicator)
    final double valuableBarWidth = MediaQuery.of(context).size.width - 32 - 60;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nutrient Title
        Container(
            margin: EdgeInsets.only(bottom: 6),
            child: Text(nutrientName, style: FontStyles().nutrientTitle)),
        // Progress Bar & Percentage Indicator
        Row(
          children: [
            Expanded(
              child: Container(
                height: 18,
                child: Stack(
                  children: [
                    // Background Bar
                    Container(
                      color: kBarBackground,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      color: Color(hexColor),
                      height: 18,
                      width: valuableBarWidth * (percentage / 100),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Text(
                            "${percentage % 1 == 0 ? percentage.toInt() : percentage}%", // 소숫점 변환
                            style: FontStyles().nestedPercentageIndicator),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                alignment: Alignment.center, width: 60, child: Text("100%"))
          ],
        ),
      ],
    );
  }
}
