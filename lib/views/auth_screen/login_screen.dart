import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/lists.dart';
import 'package:e_commerce/views/auth_screen/signup_screen.dart';
import 'package:e_commerce/views/home_screen/home.dart';
import 'package:e_commerce/widgets%20common/applogo_widget.dart';
import 'package:e_commerce/widgets%20common/bg_widget.dart';
import 'package:e_commerce/widgets%20common/button_widget.dart';
import 'package:e_commerce/widgets%20common/custom_textfield.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controllers.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Log into $appname".text.fontFamily(semibold).size(18).white.make(),
            20.heightBox,
            Obx(
              () => Column(
                children: [
                  customTextField(
                    isPass: false,
                    hintText: emailHint,
                    title: 'Email',
                    controller: controller.emailController,
                  ),
                  customTextField(
                    isPass: true,
                    hintText: passwordHint,
                    title: 'Password',
                    controller: controller.passwordController,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPassword.text.make()),
                  ),
                  5.heightBox,
                  controller.isLoading.value
                      ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(redColor),)
                      : buttonWidget(
                          title: login,
                          color: redColor,
                          textColor: whiteColor,
                          onPress: () async {
                            controller.isLoading(true);
                            await controller
                                .loginMehod(context: context)
                                .then((value) {
                              if (value != null) {
                                VxToast.show(context, msg: loggedin);
                                Get.offAll(() => const Home());
                              }
                              else{
                                controller.isLoading(false);
                              }
                            });
                          }).box.width(context.screenWidth - 60).make(),
                  7.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  7.heightBox,
                  buttonWidget(
                      title: signup,
                      color: lightgolden,
                      textColor: redColor,
                      onPress: () {
                        Get.to(() => const SignUpScreen());
                      }).box.width(context.screenWidth - 60).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: lightGrey,
                                  child: Image.asset(
                                    socialIconList[index],
                                    width: 35,
                                  ),
                                ),
                              )))
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 60)
                  .shadowMd
                  .make(),
            ),
          ],
        ),
      ),
    ));
  }
}
