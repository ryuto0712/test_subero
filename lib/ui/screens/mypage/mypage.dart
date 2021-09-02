import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/controller/controllers.dart';
import 'package:subero_mobile/data/provider/providers.dart';
import 'package:subero_mobile/data/repository/repositorys.dart';
import "widgets/index.dart";

class MyPage extends GetView<UserController> {
  final UserController c = Get.put(UserController(repository: UserRepository(userProvider: UserProvider())));
  final GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    c.getUser(box.read("userId"));
    return Scaffold(
      appBar: AppBar(title: Text('マイページ')),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              MyProfile(),
              BottomList(),
              Image.asset("images/mypage.png"),
            ],
          ),
        ),
      ),
    );
  }
}