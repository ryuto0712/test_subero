import 'package:flutter/material.dart';
import 'package:subero_mobile/ui/screens/auth/sign_up.dart';
import 'widgets/index.dart';
import "package:get/get.dart";

class Home extends StatelessWidget {
  final String area = '湯沢';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ホーム画面')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // constraints.maxWidth(Height)で縦横のサイズを取得
          return ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HomeBanner(),
              Categories(),
              AreaLessons(area),
              NewLessons(constraints.maxWidth),
              Image.asset('images/home.png'),
              FloatingActionButton(onPressed: ()=>Get.to(SignUp()),child:Text("登録ページへ")),
            ],
          );
        },
      ),
    );
  }
}
