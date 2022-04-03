import 'package:injewelme/utils/dummy_data.dart';
import 'package:injewelme/utils/index.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
                /* Meal Table 섹션 */
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    // Meal Table Item
                    return MealTableItem(indexPath: index);
                  },
                ),

                /* 다량 영양소 섹션 */
                // Title
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(
                    "다량영양소",
                    style: FontStyles().sectionTitle,
                  ),
                ),
                // Progress Bar List With Animation
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: nutrientList.length,
                    itemBuilder: (context, index) {
                      final nameList = [];
                      final valueList = [];
                      nutrientList.forEach((key, value) {
                        nameList.add(key);
                        valueList.add(value);
                      });
                      // Progress Bar Item
                      return ProgressBarItem(
                        nutrientName: nameList[index],
                        percentage: valueList[index],
                        hexColor: barColorHexList[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
