import 'package:flutter/material.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class SearchedLessons extends StatelessWidget {
  SearchedLessons(this.width);
  final double width;

  final LessonModel lesson = LessonModel(
    lessonName: '【初心者におすすめ】グラトリ入門レッスン',
    hostName: 'toichi shogo',
    lessonImage: 'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    hostIcon: 'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
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
        LessonCardMedium(lesson, width / 2),
        LessonCardMedium(lesson, width / 2),
      ],
    );
  }
}
