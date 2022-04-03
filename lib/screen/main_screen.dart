import 'package:injewelme/utils/index.dart';
import 'package:injewelme/widgets/meal_table_item.dart';

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
              children: [
                /* Meal Table 섹션 */
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    // Meal Table Item
                    return MealTableItem(indexPath: index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
