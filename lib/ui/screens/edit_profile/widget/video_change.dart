import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/edit_profile/edit_profile_controller.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class VideoChange extends StatelessWidget {
  final EditProfileController c = Get.find<EditProfileController>();
  VideoChange();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Text(c.fileName)),
          OutlinedButton(onPressed: c.editVideo, child: Text("動画を変更する")),
        ],
      ),
    );
  }
}
