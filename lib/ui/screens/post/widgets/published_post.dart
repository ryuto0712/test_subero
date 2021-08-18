import 'package:flutter/material.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class PublishedPost extends StatelessWidget {
  PublishedPost();
  List<LessonModel> lessons = [
    LessonModel(lessonId: 'sample_1', lessonName: 'lessonName', hostName: 'toichi shogo', lessonImage: 'images/app_icon.png', hostIcon: 'images/app_icon2.png', price: 3000),
    LessonModel(lessonId: 'sample_1', lessonName: 'lessonName', hostName: 'toichi shogo', lessonImage: 'images/app_icon.png', hostIcon: 'images/app_icon2.png', price: 3000),
    LessonModel(lessonId: 'sample_1', lessonName: 'lessonName', hostName: 'toichi shogo', lessonImage: 'images/app_icon.png', hostIcon: 'images/app_icon2.png', price: 3000),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(30, 30, 30, 15),
            child: Text('掲載中の投稿', style: TextStyle(fontSize: 16)),
          ),
          wideLessonCardsGenerator(lessons),
        ],
      ),
    );
  }

  Widget wideLessonCardsGenerator(List<LessonModel> lessons) {
    return Column(
      children: <Widget>[
        for (int i = 0; i < lessons.length; i++)
          LessonCardWide(
            lessonId: lessons[i].lessonId,
            width: 400,
          ),
      ],
    );
  }
}
