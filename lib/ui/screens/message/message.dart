import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/ui/screens/index.dart';

import 'widgets/index.dart';

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('メッセージ')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.to(IndividualMessage(), id: 3);
              },
              child: Text('個別メッセージ'),
            ),
            MessageContents(),
            Image.asset('images/message.png'),
          ],
        ),
      ),
    );
  }
}
