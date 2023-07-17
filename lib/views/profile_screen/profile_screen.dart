import 'package:e_commerce/consts/lists.dart';
import 'package:e_commerce/controllers/auth_controllers.dart';
import 'package:e_commerce/views/auth_screen/login_screen.dart';
import 'package:e_commerce/views/profile_screen/details_card.dart';
import 'package:e_commerce/views/profile_screen/edit_profile_screen.dart';
import 'package:e_commerce/widgets%20common/bg_widget.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ProfileController());
    
    return bgWidget(
        child: Scaffold(
            body: SafeArea(
      child: Column(children: [
        //edit profile
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: Align(
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.edit,
                color: whiteColor,
              ).onTap(() {
                Get.to(()=> const EditProfileScreen());
              })),
        ),
        //profile details
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                imgProfile2,
                width: 100,
                fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.widthBox,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Dummy user".text.white.fontFamily(semibold).make(),
                  "dummy@exmaple.com".text.white.make(),
                ],
              )),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: whiteColor,
                      ),
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  onPressed: () async {
                    await Get.put(AuthController()).signoutMethod(context);
                    Get.offAll(()=> const LoginScreen());
                  },
                  child:
                      logout.text.fontFamily(semibold).white.makeCentered()),
            ],
          ),
        ),
        20.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            detailsCard(
                count: "00",
                title: "in you cart",
                width: context.screenWidth / 3.4),
            detailsCard(
                count: "22",
                title: "in your wishlist",
                width: context.screenWidth / 3.4),
            detailsCard(
                count: "3037",
                title: "your order",
                width: context.screenWidth / 3.4),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: profileButtonList.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(color: lightGrey,);
          },
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.asset(profileButtonIcon[index], width: 20,),
              title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
            );
          },
        ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 16)).margin(const EdgeInsets.all(12)).shadowSm.make().box.color(redColor).make(),
      ]),
    )));
  }
}
