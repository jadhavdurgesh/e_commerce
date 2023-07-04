import 'package:e_commerce/consts/consts.dart';
import 'package:get/get.dart';
import '../../widgets common/applogo_widget.dart';
import '../../widgets common/bg_widget.dart';
import '../../widgets common/button_widget.dart';
import '../../widgets common/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;
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
                        checkColor: whiteColor,
                        activeColor: redColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        }),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(
                                fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: termsAndConditions,
                            style: TextStyle(
                                fontFamily: semibold, color: redColor)),
                        TextSpan(
                            text: " & ",
                            style: TextStyle(
                                fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: privacyPolicy,
                            style: TextStyle(
                                fontFamily: semibold, color: redColor)),
                      ])),
                    )
                  ],
                ),
                5.heightBox,
                buttonWidget(
                        title: signup,
                        color: isCheck == true ? redColor : lightGrey,
                        textColor: whiteColor,
                        onPress: () {})
                    .box
                    .width(context.screenWidth - 60)
                    .make(),
                10.heightBox,
                // wrapping into gesture detector of velocity_x
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    alreadyHaveAnAccount.text.color(fontGrey).make(),
                    login.text.color(redColor).semiBold.make().onTap(() {
                      Get.back();
                    })
                  ],
                )
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
