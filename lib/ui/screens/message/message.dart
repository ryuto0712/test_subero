import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/ui/screens/index.dart';

import 'widgets/index.dart';

// TODO: 進行中/終了したレッスン情報の取得
// TODO:

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('メッセージ一覧'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MessageContents(),
            Image.asset('images/message.png'),
          ],
        ),
      ),
    );
  }
}
