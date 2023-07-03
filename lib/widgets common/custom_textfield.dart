import 'package:e_commerce/consts/consts.dart';

Widget customTextField({String? hintText, String? title , controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.fontFamily(semibold).color(redColor).size(16).make(),
      5.heightBox,
      TextFormField(
        // controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: textfieldGrey,
            fontFamily: regular,
          ),
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: redColor,
            )
          ),
          isDense: true
        ),
      ),
      5.heightBox,
    ],
  );
}