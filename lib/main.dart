import 'package:get/get.dart';
import 'consts/consts.dart';
import 'views/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // we are using getx , so we need to change materialapp to getmaterialapp
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
        fontFamily: regular,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}