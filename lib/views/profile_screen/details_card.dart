import 'package:e_commerce/consts/consts.dart';

Widget detailsCard({String? count, String? title, width}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(semibold).size(16).color(darkFontGrey).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make(),
    ],
  )
      .box
      .white
      .roundedSM
      .width(width)
      .height(80)
      .padding(const EdgeInsets.all(4))
      .make();
}
