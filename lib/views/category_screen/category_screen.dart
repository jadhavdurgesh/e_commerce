import 'package:e_commerce/views/category_screen/category_detail_screen.dart';
import 'package:e_commerce/widgets%20common/bg_widget.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../consts/lists.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: whiteColor),
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 200,
          ),
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Image.asset(
                  categoriesImages[index],
                  width: 200,
                  height: 130,
                  fit: BoxFit.cover,
                ),
                10.heightBox,
                categoriesList[index]
                    .text
                    .align(TextAlign.center)
                    .color(fontGrey)
                    .make(),
              ],
            )
                .box
                .white
                .rounded
                .outerShadowSm
                .clip(Clip.antiAlias)
                .make()
                .onTap(() {
              Get.to(() => CategoryDetailScreen(title: categoriesList[index]));
            });
          },
        ),
      ),
    ));
  }
}
