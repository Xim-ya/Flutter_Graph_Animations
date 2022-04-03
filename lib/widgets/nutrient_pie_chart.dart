import 'package:injewelme/utils/index.dart';

class NutrientPieChart extends StatelessWidget {
  final MealController c;
  const NutrientPieChart({Key? key, required this.c}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealController>(
        init: c,
        builder: (getxContext) {
          final pieChartSize = MediaQuery.of(context).size.width / 1.7;
          return c.pieChartAnimated
              ? PieChart(
                  dataMap: c.nutrientList,
                  animationDuration: Duration(milliseconds: 2500),
                  chartRadius: pieChartSize,
                  colorList: barColorHexList,
                  legendOptions: LegendOptions(
                    showLegendsInRow: true,
                    legendPosition: LegendPosition.bottom,
                  ),
                  chartValuesOptions: ChartValuesOptions(
                      showChartValuesInPercentage: true,
                      chartValueStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      showChartValueBackground: false),
                )
              : SizedBox(
                  height: pieChartSize,
                );
        });
  }
}
