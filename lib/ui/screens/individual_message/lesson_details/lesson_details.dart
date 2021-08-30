import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_details/lesson_details_controller.dart';

import 'package:subero_mobile/ui/widgets/like_button.dart';
import 'package:subero_mobile/ui/screens/index.dart';

import 'widgets/index.dart';

// TODO: データ取得時のくるくる

class LessonDetails extends StatelessWidget {
  final LessonDetailsController c = Get.find<LessonDetailsController>();

  @override
  Widget build(BuildContext context) {
    // レッスンデータの取得．lessonIdはparametersで渡すことを想定
    c.getLesson(Get.parameters['lessonId'] ?? 'sample_1');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: Get.back),
      ),
      extendBodyBehindAppBar: true, // appBarの下で描画する
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                  Positioned(child: LikeButton(30), top: 130, left: 330),
                ],
              ),
            ),
          ),
          Container(
            child: ElevatedButton(onPressed: () => Get.to(BeforePurchase(), id: null), child: Text('受講する')),
          ),
        ],
      ),
    );
  }
}
