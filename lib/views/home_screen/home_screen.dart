import 'package:e_commerce/views/home_screen/components/featured_button.dart';
import 'package:e_commerce/widgets%20common/home_buttons.dart';

import '../../consts/consts.dart';
import '../../consts/lists.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        color: lightGrey,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 60,
                color: lightGrey,
                alignment: Alignment.center,
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: searchanything,
                      hintStyle: TextStyle(color: textfieldGrey)),
                ),
              ),
              10.heightBox,
              //swiper brands
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 150,
                          enlargeCenterPage: true,
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          itemCount: slidersList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              slidersList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                            (index) => homeButtons(
                                  height: context.screenHeight * 0.15,
                                  width: context.screenWidth / 2.5,
                                  icon: index == 0 ? icTodaysDeal : icFlashDeal,
                                  title: index == 0 ? todayDeal : flashSale,
                                )),
                      ),
                      10.heightBox,
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 150,
                          enlargeCenterPage: true,
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          itemCount: secondSlidersList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              secondSlidersList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            3,
                            (index) => homeButtons(
                                  height: context.screenHeight * 0.13,
                                  width: context.screenWidth / 3.5,
                                  icon: index == 0
                                      ? icTopCategories
                                      : index == 1
                                          ? icBrands
                                          : icTopSeller,
                                  title: index == 0
                                      ? topCategories
                                      : index == 1
                                          ? brand
                                          : topSellers,
                                )),
                      ),
                      20.heightBox,

                      //Featured Categories
                      Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: featuredCategories.text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .size(18)
                              .make()),

                      20.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                                3,
                                (index) => Column(
                                      children: [
                                        featuredButton(
                                          icon: featuredImages1[index],
                                          title: featuredTitle1[index],
                                        ),
                                        10.heightBox,
                                        featuredButton(
                                          icon: featuredImages2[index],
                                          title: featuredTitle2[index],
                                        ),
                                      ],
                                    )).toList()),
                      ),
                      20.heightBox,
                      // Featured product
                      Container(
                        width: context.screenWidth,
                        padding: EdgeInsets.all(12),
                        decoration: const BoxDecoration(color: redColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            featuredProduct.text.white
                                .fontFamily(bold)
                                .size(18)
                                .make(),
                            10.heightBox,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  6,
                                  (index) => Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        imgP1,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      10.heightBox,
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
                                      .margin(const EdgeInsets.symmetric(horizontal: 4))
                                      .padding(const EdgeInsets.all(8))
                                      .make(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.heightBox,

                      // Third swiper 
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 150,
                          enlargeCenterPage: true,
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          itemCount: secondSlidersList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              secondSlidersList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),

                      // All products sections 
                      20.heightBox,
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          mainAxisExtent: 300,
                        ),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        imgP5,
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                      const Spacer(),
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
                                      .margin(const EdgeInsets.symmetric(horizontal: 4))
                                      .padding(const EdgeInsets.all(12))
                                      .make();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
