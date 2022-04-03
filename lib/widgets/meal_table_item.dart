import 'package:injewelme/utils/index.dart';

class MealTableItem extends StatelessWidget {
  final int indexPath;
  const MealTableItem({Key? key, required this.indexPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: Text("조식", style: FontStyles().sectionTitle),
                ),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "828", style: FontStyles().kcalHighLight),
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
                        "율무밥",
                        style: FontStyles().mealTitle,
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: kPink,
                        ),
                      )
                    ],
                  ),
                  // 식단 디테일 리스트
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      const SizedBox(height: 16),
                      mealOption("종류", "밥류"),
                      mealOption("재료", "흰쌀1, 흰쌀2, 재료3, 재료4, 재료5",
                          wrappingMargin: _wrappingMargin),
                      mealOption("정량", "210g"),
                      mealOption("칼로리", "130kca"),
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
