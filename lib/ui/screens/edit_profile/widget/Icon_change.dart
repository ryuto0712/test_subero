import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/edit_profile/edit_profile_controller.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class IconChange extends StatelessWidget {
  final EditProfileController c = Get.find<EditProfileController>();
  IconChange();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Column(
          children: [
            NetworkCircleImage(100,
                alt: "images/app_icon2.png", imageUrl: c.user.iconUrl),
            OutlinedButton(onPressed: c.editImage, child: Text("画像を変更する"))
          ],
        ),
      ),
    );
  }
}
