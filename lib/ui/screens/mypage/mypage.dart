import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/my_page/user_controller.dart';
import "../../../controller/controllers.dart";
import "./widgets/bottom_list.dart";
import './widgets/my_profile.dart';

class MyPage extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    final UserController c = Get.find<UserController>();
    c.getUser("1");
    String video = 'images/icon_sample.png';
    return Scaffold(
      appBar: AppBar(title: Text('マイページ')),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Obx(
                () => MyProfile(c.user.name, c.user.introduction, video,
                    c.user.career, c.user.favoriteTrick, c.user.homeSkiResort),
              ),
              BottomList(),
              Image.asset('images/mypage.png'),
            ],
          ),
        ),
      ),
    );
  }
}
