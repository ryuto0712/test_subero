import 'package:flutter/material.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class PublishedPost extends StatelessWidget {
  final List<LessonModel> lessons = [
    for (int i = 0; i < 3; i++)
      LessonModel(
        lessonId: 'sample_$i',
        lessonName: 'lessonName$i',
        hostName: 'toichi shogo',
        lessonImage: 'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
        hostIcon: 'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
        price: 3000,
      ),
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
            lesson: lessons[i],
            width: 400,
          ),
      ],
    );
  }
}
