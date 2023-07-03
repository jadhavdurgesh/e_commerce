import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/views/auth_screen/login_screen.dart';
import 'package:e_commerce/widgets%20common/applogo_widget.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  changeScreen(){
    Future.delayed(const Duration(seconds: 2),() {
      // usign getx to jump to next screen
      Get.to( ()=> LoginScreen());
    },);
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg , width: 300,)
            ),
            80.heightBox,
            appLogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(), // possible by velocity_x
            5.heightBox,
            appversion.text.fontFamily(semibold).size(11).white.make(), // possible by velocity_x
            const Spacer(),
            credits.text.fontFamily(semibold).white.make(),
            30.heightBox,

            // Splash screen ui is done 
          ],
        ),
      ),
    );
  }
}