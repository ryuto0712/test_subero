import 'package:flutter/material.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class NewLessons extends StatelessWidget {
  final double width;
  NewLessons(this.width);

  final List<LessonModel> lessons = [
    for (int i = 0; i < 2; i++)
      LessonModel(
        lessonName: '【初心者におすすめ】グラトリ入門レッスン',
        hostName: 'toichi shogo',
        lessonImage: 'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
        hostIcon: 'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
      )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('新着レッスン'),
          ),
          _newLessons(),
        ],
      ),
    );
  }

  Widget _newLessons() {
    return Container(
      child: Column(
        children: <Widget>[
          rowCards(),
          rowCards(),
        ],
      ),
    );
  }

  Widget rowCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 2; i++) LessonCardMedium(lessons[0], width / 2),
      ],
    );
  }
}
