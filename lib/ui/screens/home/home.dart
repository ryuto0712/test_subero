import 'package:flutter/material.dart';
import 'widgets/index.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatelessWidget {
  final String area = '野沢温泉スキー場';
  final GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ホーム画面')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // constraints.maxWidth(Height)で縦横のサイズを取得
          return ListView(
            children: <Widget>[
              HomeBanner(),
              Categories(),
              AreaLessons(area),
              NewLessons(constraints.maxWidth),
              Image.asset('images/home.png'),
            ],
          );
        },
      ),
    );
  }
}
