import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/data/provider/user_provider.dart';
import 'package:subero_mobile/data/repository/test_repository.dart';
import '../../../controller/my_page/user_controller.dart';
import "../../../controller/controllers.dart";
import "./widgets/bottom_list.dart";
import './widgets/my_profile.dart';

class MyPage extends GetView<UserController> {

  @override
  Widget build(BuildContext context) {
    final UserController c = Get.find<UserController>();
    c.getUser("1");
  String userName = c.user.name;
  String description = c.user.introduction;
  String playedYear = c.user.playedYear;
  // String sponser = c.user.sponser;
  String favoTrick = c.user.favoTrick;
  String homeGerende = c.user.homeGerende;
  String video = 'images/icon_sample.png';
    return Scaffold(
      appBar: AppBar(title: Text('マイページ')),
      body: SingleChildScrollView(
        child: Container
        (
          color: Colors.white,
          child:Column(
          children: <Widget>[
            // #todo: 隠れちゃう
            MyProfile(userName,description, video,playedYear,favoTrick,homeGerende),
            BottomList(),
            Image.asset('images/mypage.png'),
          ],
        ),
        ),
      ),
    );
  }
}