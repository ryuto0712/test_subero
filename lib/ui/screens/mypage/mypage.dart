import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/data/provider/providers.dart';
import 'package:subero_mobile/data/repository/repositorys.dart';
import '../../../controller/my_page/user_controller.dart';
import "../../../controller/controllers.dart";
import "./widgets/bottom_list.dart";
import './widgets/my_profile.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class MyPage extends GetView<UserController> {


  @override
  Widget build(BuildContext context) {
    final UserController c = Get.put(UserController(repository: UserRepository(userProvider: UserProvider())));
    final GetStorage box = GetStorage();
    c.getUser(box.read("userId"));
    // download();
    String video = 'images/icon_sample.png';
    return Scaffold(
      appBar: AppBar(title: Text('マイページ')),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Obx(
                () => MyProfile(c.user.name, c.user.introduction, video,c.user.iconUrl,
                    c.user.career, c.user.favoriteTrick, c.user.homeSkiResort),
              ),
              BottomList(),
              Image.asset("images/mypage.png"),
            ],
          ),
        ),
      ),
    );
  }
}
