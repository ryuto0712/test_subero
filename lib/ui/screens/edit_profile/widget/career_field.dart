import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:subero_mobile/controller/edit_profile/edit_profile_controller.dart';

class CareerField extends StatelessWidget {
  final EditProfileController c = Get.find<EditProfileController>();
  CareerField();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 10)),
        Text("スノボ歴"),
        Padding(padding: EdgeInsets.only(top: 5)),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(0),
              ),
            ),
            Expanded(
              flex: 2,
              child: Obx(
                () => TextFormField(
                  onChanged: (text) => c.user.career = int.parse(text),
                  initialValue: c.user.career.toString(),
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
            ),
            Expanded(flex: 1, child: Text("年")),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
