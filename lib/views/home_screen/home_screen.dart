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
                      suffixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: searchanything,
                      hintStyle: TextStyle(color: textfieldGrey)),
                ),
              ),
              8.heightBox,
              //swiper brands
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
                    ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                  }
              ),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(2, (index) => homeButtons(
                  height: context.screenHeight*0.15,
                  width: context.screenWidth/2.5,
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
                    ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                  }
              ),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) => homeButtons(
                  height: context.screenHeight*0.13,
                  width: context.screenWidth/3.5,
                  icon: index == 0 ? icTopCategories : index == 1 ? icBrands : icTopSeller,
                  title: index == 0 ? topCategories : index == 1 ? brand : topSellers,
                )),
              ),
              10.heightBox,

              //Featured Categories 
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: featuredCategories.text.fontFamily(semibold).color(darkFontGrey).size(18).make()),
            ],
          ),
        ),
      ),
    );
  }
}
