import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/views/category_screen/items_details_screen.dart';
import 'package:e_commerce/widgets%20common/bg_widget.dart';
import 'package:get/get.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String? title;
  const CategoryDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: whiteColor),
        title: title!.text.fontFamily(bold).white.make(),
        actions: const [
          Icon(Icons.search),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      6,
                      (index) => "Mens Clothing"
                          .text
                          .size(12)
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .makeCentered()
                          .box
                          .size(120, 60)
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .roundedSM
                          .white
                          .make())),
            ),

            20.heightBox,

            //items container
            Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imgP5,
                      width: 200,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    "Laptop 4GB/64GB"
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    "\$600"
                        .text
                        .size(16)
                        .color(redColor)
                        .fontFamily(bold)
                        .make()
                  ],
                )
                    .box
                    .roundedSM
                    .white
                    .outerShadow
                    .margin(const EdgeInsets.symmetric(horizontal: 4))
                    .padding(const EdgeInsets.all(12))
                    .make()
                    .onTap(() {
                      Get.to( ()=> const ItemDetailsScreen(title: "Dummy title"));
                    });
              },
            ))
          ],
        ),
      ),
    ));
  }
}
