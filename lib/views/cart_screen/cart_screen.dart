import 'package:e_commerce/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: "Cart is empty".text.color(darkFontGrey).fontFamily(bold).makeCentered(),
    );
  }
}