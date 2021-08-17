import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_details/lesson_details_controller.dart';

import 'package:subero_mobile/ui/widgets/like_button.dart';
import 'package:subero_mobile/ui/screens/index.dart';

import 'widgets/index.dart';

class LessonDetails extends StatelessWidget {
  final LessonDetailsController c = Get.find<LessonDetailsController>();

  @override
  Widget build(BuildContext context) {
    // レッスンデータの取得．lessonIdはparametersで渡すことを想定
    c.getLesson(Get.parameters['lesson_id'] ?? 'sample_1');

    return Scaffold(
      appBar: AppBar(title: Text('レッスン詳細')),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                EyeCatch(),
                LessonContents(),
                Comments(),
                Image.asset('images/lesson_detail_event.png'),
              ],
            ),
            Host(),
            // #todo: 位置の設定の見直し
            Positioned(child: LikeButton(30), top: 130, left: 330),
            Positioned(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(BeforePurchase(), id: null);
                },
                child: Text('購入'),
              ),
              top: 30,
              left: 150,
            ),
          ],
        ),
      ),
    );
  }
}
