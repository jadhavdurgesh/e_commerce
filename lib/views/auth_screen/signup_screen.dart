import 'package:e_commerce/consts/consts.dart';
import 'package:get/get.dart';

import '../../consts/lists.dart';
import '../../widgets common/applogo_widget.dart';
import '../../widgets common/bg_widget.dart';
import '../../widgets common/button_widget.dart';
import '../../widgets common/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Join the $appname".text.fontFamily(semibold).size(18).white.make(),
            20.heightBox,
            Column(
              children: [
                customTextField(
                  hintText: nameHint,
                  title: name,
                ),
                customTextField(
                  hintText: emailHint,
                  title: 'Email',
                  controller: emailController,
                ),
                customTextField(
                  hintText: passwordHint,
                  title: 'Password',
                  controller: passwordController,
                ),
                customTextField(
                  hintText: passwordHint,
                  title: confirmPassword,
                ),
                5.heightBox,
                Row(
                  children: [
                    Checkbox(
                        checkColor: redColor,
                        value: false,
                        onChanged: (newValue) {}),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "I agree to the ",
                            style:
                                TextStyle(fontFamily: bold, color: fontGrey)),
                        TextSpan(
                            text: termsAndConditions,
                            style:
                                TextStyle(fontFamily: bold, color: redColor)),
                        TextSpan(
                            text: " & ",
                            style:
                                TextStyle(fontFamily: bold, color: fontGrey)),
                        TextSpan(
                            text: privacyPolicy,
                            style:
                                TextStyle(fontFamily: bold, color: redColor)),
                      ])),
                    )
                  ],
                ),
                5.heightBox,
                buttonWidget(
                        title: signup,
                        color: redColor,
                        textColor: whiteColor,
                        onPress: () {})
                    .box
                    .width(context.screenWidth - 60)
                    .make(),
                10.heightBox,
                // wrapping into gesture detector of velocity_x
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: alreadyHaveAnAccount,
                      style: TextStyle(fontFamily: bold, color: fontGrey)),
                  TextSpan(
                      text: login,
                      style: TextStyle(fontFamily: bold, color: redColor))
                ])).onTap(() {
                  Get.back();
                })
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 60)
                .shadowMd
                .make(),
          ],
        ),
      ),
    ));
  }
}
