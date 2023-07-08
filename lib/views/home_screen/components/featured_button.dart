import 'package:e_commerce/consts/consts.dart';

Widget featuredButton({String? title, icon}){
  return Row(
    children: [
      Image.asset(icon, width: 60, fit: BoxFit.fill,),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  ).box.width(200).roundedSM.margin(const EdgeInsets.symmetric(horizontal: 4)).padding(const EdgeInsets.all(4)).outerShadowSm.white.make();
}