import 'dart:io';

import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/controllers/profile_controller.dart';
import 'package:e_commerce/widgets%20common/button_widget.dart';
import 'package:e_commerce/widgets%20common/custom_textfield.dart';
import 'package:get/get.dart';

import '../../widgets common/bg_widget.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: whiteColor),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // if data image url and controller path is empty
                data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    // if data is not empty but the controller is empty path
                    : data['imageUrl'] != '' &&
                            controller.profileImgPath.isEmpty
                        ? Image.network(
                            data['imageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()

                        // else if controller is not empty but data is
                        : Image.file(
                            File(controller.profileImgPath.value),
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                buttonWidget(
                  color: redColor,
                  onPress: () {
                    controller.changeImage(context);
                  },
                  textColor: whiteColor,
                  title: "Change",
                ),
                const Divider(),
                20.heightBox,
                customTextField(
                  controller: controller.nameController,
                  hintText: nameHint,
                  isPass: false,
                  title: name,
                ),
                customTextField(
                  controller: controller.passwordController,
                  hintText: passwordHint,
                  isPass: true,
                  title: password,
                ),
                20.heightBox,
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : SizedBox(
                        width: context.screenWidth - 40,
                        child: buttonWidget(
                          color: redColor,
                          onPress: () async {
                            controller.isLoading(true);

                            await controller.uploadFileImage();
                            await controller.updateProfile(
                              imgUrl: controller.profileImageLink,
                              name: controller.nameController.text,
                              password: controller.passwordController.text,
                            );
                            VxToast.show(context,
                                msg: "Profile updated successfuly");
                          },
                          textColor: whiteColor,
                          title: "Save",
                        ),
                      ),
              ],
            )
                .box
                .shadowSm
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
                .make(),
          ),
        ),
      ),
    );
  }
}
