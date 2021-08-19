import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:subero_mobile/controller/edit_profile/edit_profile_controller.dart';


class IntroductionField extends StatelessWidget{
  final EditProfileController c = Get.find<EditProfileController>();
  IntroductionField();

  @override
  Widget build(BuildContext context){
  return
  Column(
    children: [
      Padding(padding: EdgeInsets.only(top: 10)),
                Text("自己紹介"),
      Padding(padding: EdgeInsets.only(top: 5)),
                Obx(()=>
                TextFormField(
                  onChanged: (text)=>c.user.introduction = text,
                  initialValue: c.user.introduction,
                  maxLines: 5,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),),
    ],
  );
  }
}