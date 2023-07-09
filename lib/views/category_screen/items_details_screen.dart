import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/widgets%20common/button_widget.dart';

import '../../consts/lists.dart';

class ItemDetailsScreen extends StatelessWidget {
  final String? title;
  const ItemDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.color(darkFontGrey).make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        aspectRatio: 16 / 9,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),
                    10.heightBox,
                    // title and details section
                    title!.text
                        .size(16)
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    //rating
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      stepInt: true,
                    ),
                    10.heightBox,
                    "\$30,000"
                        .text
                        .fontFamily(bold)
                        .color(redColor)
                        .size(18)
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller".text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            "In House Brands"
                                .text
                                .fontFamily(semibold)
                                .size(16)
                                .color(darkFontGrey)
                                .make()
                          ],
                        )),
                        const CircleAvatar(
                          child: Icon(
                            Icons.message_outlined,
                            color: darkFontGrey,
                          ),
                        )
                      ],
                    )
                        .box
                        .height(60)
                        .color(textfieldGrey)
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .make(),
                    20.heightBox,

                    // color selection

                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                                children: List.generate(
                                    3,
                                    (index) => VxBox()
                                        .color(Vx.randomPrimaryColor)
                                        .size(40, 40)
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 4))
                                        .roundedFull
                                        .make()))
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Quantity: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {}, icon: const Icon(Icons.remove)),
                                "0"
                                    .text
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .size(16)
                                    .make(),
                                IconButton(
                                    onPressed: () {}, icon: const Icon(Icons.add)),
                                10.widthBox,
                                "(0 available)"
                                    .text
                                    .color(textfieldGrey)
                                    .make(),
                              ],
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total: ".text.color(textfieldGrey).make(),
                            ),
                            "\$0.00".text.size(16).color(redColor).make()
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make()
                      ],
                    ).box.white.shadowSm.make(),
                    10.heightBox,
                    // description section
                    "Description"
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    "This is a dummy product , if you will buy this you will end up getting nothing because I already said it is dummy product...."
                        .text
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    // Buttons section
                    ListView(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          itemsDetailButtonsList.length,
                          (index) => ListTile(
                                title: itemsDetailButtonsList[index]
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                trailing: const Icon(Icons.arrow_forward),
                              )),
                    ),
                    20.heightBox,
                    productsmayyoulike.text.color(darkFontGrey).fontFamily(bold).size(16).make(),
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
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: buttonWidget(
                color: redColor,
                textColor: whiteColor,
                onPress: () {},
                title: cart),
          )
        ],
      ),
    );
  }
}
