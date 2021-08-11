import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/index.dart';

class MyPage extends StatelessWidget {
  String userName = 'TOICHI SHOGO';
  String description = 'はじめまして！gnuのライダーをしている十市です！スノボ歴は5年で得意なジャンルは地理です！';
  Map<String, String> profileMap = {
    'スノボ歴': '5年',
    'スポンサー': 'Gnu, わか大将',
    '得意な技': 'CAB1440',
    'ホームゲレンデ': '神立スキー場',
  };
  String video = 'images/icon_sample.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('マイページ')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // #todo: 隠れちゃう
            MyProfile(userName, description + '\n' + description, video),
            BottomList(),
            Image.asset('images/mypage.png'),
          ],
        ),
      ),
    );
  }
}
