import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_details/lesson_details_controller.dart';

import 'package:subero_mobile/ui/widgets/like_button.dart';
import 'package:subero_mobile/ui/screens/index.dart';

import 'widgets/index.dart';

class LessonDetails extends StatelessWidget {
  final LessonDetailsController c = Get.find<LessonDetailsController>();

  final String hostName = 'Toichi Shogo';
  final String hostIcon = 'images/icon_sample.png';
  final double rating = 5.0;
  final String lessonIcon = 'images/icon_sample.png';
  final List<String> tagNames = [
    '個人レッスン',
    '初心者',
    'グラトリ',
  ];
  final List<String> comments = ['複数人でのご利用も可能です', 'スノーボード上手ですか？', '上手です'];
  final List<String> userNames = ['Toichi Shogo', 'SuberoUser_1', 'Toichi Shogo'];
  final List<String> userIcons = [
    'images/icon_sample.png',
    'images/icon_sample.png',
    'images/icon_sample.png',
  ];
  final String titleText = '【初心者におすすめ】グラトリ入門3時間レッスン';
  final String description = '「グラトリをやってみたいけど，どうすればいいかわからない。」「始めてみたいけどいまいち上手くいかない。」といった方におすすめのレッスンです！\n\n私は5年のスノボ歴があり，誰にでも分かりやすい指導には定評があります！\n\nお悩みの方はぜひ受講してください！';

  @override
  Widget build(BuildContext context) {
    c.getLesson(Get.parameters['lesson_id'] ?? 'sample_1'); // レッスンデータの取得．parametersで渡すことを想定
    return Scaffold(
      appBar: AppBar(title: Text('レッスン詳細')),
      body: SingleChildScrollView(
        child: Obx(
          () => Stack(
            children: [
              Column(
                children: [
                  EyeCatch(c.lesson.lessonImage),
                  LessonContents(
                    lessonName: c.lesson.lessonName,
                    tagNames: tagNames,
                    lessonDescription: c.lesson.lessonDescription,
                    price: c.lesson.price,
                    lessonDuration: c.lesson.lessonDuration,
                    date: c.lesson.date,
                    skiResort: c.lesson.skiResort,
                    comments: comments,
                    userNames: userNames,
                    userIcons: userIcons,
                  ),
                  Comments(),
                  Image.asset('images/lesson_detail_event.png'),
                ],
              ),
              Host(c.lesson.hostName, c.lesson.hostIcon, c.lesson.hostRating),
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
      ),
    );
  }
}
