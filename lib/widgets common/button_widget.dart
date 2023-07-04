import 'package:e_commerce/consts/consts.dart';

Widget buttonWidget({onPress, color, textColor,String? title}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(12)
    ),
    onPressed: onPress,
    child: title!.text.color(textColor).fontFamily(bold).make()
    );
}