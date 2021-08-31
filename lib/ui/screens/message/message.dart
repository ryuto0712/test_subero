import 'package:flutter/material.dart';

import 'widgets/index.dart';

// TODO: 進行中/終了したレッスン情報の取得

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('メッセージ一覧'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            MessageContents(),
            // Image.asset('images/message.png'),
          ],
        ),
      ),
    );
  }
}
