import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:subero_mobile/controller/edit_profile/edit_profile_controller.dart';

class FavoriteTrickField extends StatelessWidget {
  final EditProfileController c = Get.find<EditProfileController>();
  FavoriteTrickField();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 10)),
        Text("εΎζγͺζ"),
        Padding(padding: EdgeInsets.only(top: 5)),
        Obx(
          () => TextFormField(
            onChanged: (text) => c.user.favoriteTrick = text,
            initialValue: c.user.favoriteTrick,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
        ),
      ],
    );
  }
}
