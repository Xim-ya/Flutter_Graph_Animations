import 'package:injewelme/utils/index.dart';

class MealTableItem extends StatelessWidget {
  final int indexPath;
  final MealController c;
  const MealTableItem({Key? key, required this.indexPath, required this.c})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealItem = c.mealList[indexPath];
    final _wrappingMargin =
        getResponsiveWidth(MediaQuery.of(context).size.width, 32);
    return Container(
      height: 216,
      decoration: BoxDecoration(
        border: Border(
          top: const BorderSide(width: 1, color: kTableBorder),
          bottom:
              BorderSide(width: indexPath == 2 ? 1 : 0, color: kTableBorder),
        ),
      ),
      child: Row(
        children: [
          /* Left 섹션 */
          Container(
            width: getResponsiveWidth(MediaQuery.of(context).size.width, 108),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(width: 1, color: kTableBorder),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24, bottom: 16),
                  child: Text(mealTime[mealItem.mealTime].toString(),
                      style: FontStyles().sectionTitle),
                ),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: mealItem.kcal.toString(),
                          style: FontStyles().kcalHighLight),
                      const TextSpan(text: "kcal"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          /* Right 섹션 */
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 24),
              child: Column(
                children: [
                  // 식단 이름
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mealItem.mealName,
                        style: FontStyles().mealTitle,
                      ),
                      GetBuilder<MealController>(
                          init: c,
                          builder: (context) {
                            return IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () {
                                c.toggleFavoriteMeal(mealItem.id);
                              },
                              icon: Icon(
                                c.selectedMealList.contains(mealItem.id)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: kPink,
                              ),
                            );
                          }),
                    ],
                  ),
                  // 식단 디테일 리스트
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      const SizedBox(height: 16),
                      mealOption("종류", mealType[mealItem.mealType].toString()),
                      mealOption("재료", mealItem.mealIngredient.join(', '),
                          wrappingMargin: _wrappingMargin),
                      mealOption("정량", "${mealItem.gram}g"),
                      mealOption("칼로리", "${mealItem.kcal}kcal"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mealOption(String title, String content, {double? wrappingMargin}) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: wrappingMargin ?? 0),
            child: Text(
              title,
              style: FontStyles().mealOption,
            ),
          ),
          Flexible(
              child: Text(
            content,
            style: FontStyles().mealOption,
            textAlign: TextAlign.end,
          ))
        ],
      ),
    );
  }

  // 기기 사이즈에 맞게 반응형 넓이 값을 반환하는 메소드
  double getResponsiveWidth(double deviceWidth, double targetWidth) {
    return deviceWidth * targetWidth / deviceWidth;
  }
}
