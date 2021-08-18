import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/bindings/post_event_binding.dart';
import 'package:subero_mobile/routes/app_routes.dart';

import 'package:subero_mobile/ui/screens/index.dart';

class NewPost extends StatelessWidget {
  NewPost();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(30, 10, 30, 15),
              child: Text('新規投稿', style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[postLesson(), postEvent()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget postLesson() {
    return Container(
      child: GestureDetector(
        onTap: () => Get.to(PostPermanentLesson(), id: null),
        child: Card(
          child: Column(
            children: <Widget>[
              Text('常設レッスン', style: TextStyle(fontSize: 18)),
              Icon(Icons.calendar_today, size: 60, color: Colors.blue),
              Text('お客様が日付を指定して\n予約ができます'),
            ],
          ),
        ),
      ),
    );
  }

  Widget postEvent() {
    return Container(
      child: GestureDetector(
        onTap: () => Get.to(PostEvent(), binding: LessonPostBinding()),
        child: Card(
          child: Column(
            children: <Widget>[
              Text('イベント', style: TextStyle(fontSize: 18)),
              Icon(Icons.supervised_user_circle, size: 60, color: Colors.pink),
              Text('時間を指定したイベントを\n投稿できます'),
            ],
          ),
        ),
      ),
    );
  }
}
