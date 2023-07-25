import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/consts/lists.dart';
import 'package:e_commerce/controllers/auth_controllers.dart';
import 'package:e_commerce/views/auth_screen/login_screen.dart';
import 'package:e_commerce/views/profile_screen/details_card.dart';
import 'package:e_commerce/views/profile_screen/edit_profile_screen.dart';
import 'package:e_commerce/widgets%20common/bg_widget.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../controllers/profile_controller.dart';
import '../../services/firestore_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
        child: Scaffold(
            body: StreamBuilder(
      stream: FirestoreServices.getUser(currentUser!.uid),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(redColor),
            ),
          );
        } else {
          // docs == 0 because it is for single user
          var data = snapshot.data!.docs[0];
          return SafeArea(
            child: Column(children: [
              //edit profile
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.edit,
                      color: whiteColor,
                    ).onTap(() {
                      controller.nameController.text = data['name'];
                      controller.passwordController.text = data['password'];
                      Get.to(() => EditProfileScreen(
                            data: data,
                          ));
                    })),
              ),
              //profile details
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    data['imageUrl'] == ''
                        ? Image.asset(
                            imgProfile2,
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.network(
                            data['imageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "${data['name']}"
                            .text
                            .white
                            .fontFamily(semibold)
                            .make(),
                        "${data['email']}".text.white.make(),
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
                          await Get.put(AuthController())
                              .signoutMethod(context);
                          Get.offAll(() => const LoginScreen());
                        },
                        child: logout.text
                            .fontFamily(semibold)
                            .white
                            .makeCentered()),
                  ],
                ),
              ),
              12.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(
                      count: data['cart_count'],
                      title: "in you cart",
                      width: context.screenWidth / 3.4),
                  detailsCard(
                      count: data['wishlist_count'],
                      title: "in your wishlist",
                      width: context.screenWidth / 3.4),
                  detailsCard(
                      count: data['order_count'],
                      title: "your order",
                      width: context.screenWidth / 3.4),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: profileButtonList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: lightGrey,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.asset(
                      profileButtonIcon[index],
                      width: 20,
                    ),
                    title: profileButtonList[index]
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                  );
                },
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.symmetric(horizontal: 16))
                  .margin(const EdgeInsets.all(12))
                  .shadowSm
                  .make()
                  .box
                  .color(redColor)
                  .make(),
            ]),
          );
        }
      },
    )));
  }
}
