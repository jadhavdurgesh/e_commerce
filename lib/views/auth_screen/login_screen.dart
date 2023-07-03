import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/lists.dart';
import 'package:e_commerce/widgets%20common/applogo_widget.dart';
import 'package:e_commerce/widgets%20common/bg_widget.dart';
import 'package:e_commerce/widgets%20common/button_widget.dart';
import 'package:e_commerce/widgets%20common/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
              (context.screenHeight * 0.1 ).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Log into $appname".text.fontFamily(semibold).size(18).white.make(),
              20.heightBox,
              Column(
                children: [
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: (){}, 
                      child: forgetPassword.text.make()
                    ),
                  ),
                  5.heightBox,
                  buttonWidget(
                    title: login,
                    color: redColor, 
                    textColor: whiteColor, 
                    onPress: (){}
                  ).box.width(context.screenWidth-60).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  buttonWidget(
                    title: singup,
                    color: lightgolden, 
                    textColor: redColor, 
                    onPress: (){}
                  ).box.width(context.screenWidth-60).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
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
                            width: 30,
                            ),
                        ),
                      )
                      )
                  )

                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-60).shadowMd.make(),
            ],
          ),
        ),
      )
    );
  }
}