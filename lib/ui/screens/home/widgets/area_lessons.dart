import 'package:flutter/material.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class AreaLessons extends StatelessWidget {
  final String area;
  AreaLessons(this.area);

  final List<String> lessonNames = [
    'グラトリ半日レッスン',
    'やさしい初心者レッスン',
    '上級者向けレッスン',
    'グラトリ半日レッスン',
    'やさしい初心者レッスン',
    '上級者向けレッスン',
  ];
  final List<String> hostNames = [
    'Toichi Shogo',
    'toichi shogo',
    'TOICHI SHOGO',
    'Toichi Shogo',
    'toichi shogo',
    'TOICHI SHOGO',
  ];
  final List<String> lessonIcons = [
    'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
  ];
  final List<String> hostIcons = [
    'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(area + 'のレッスン'),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (int i = 0; i < lessonNames.length; i++)
                    LessonCardSmall(
                      LessonModel(
                        lessonName: lessonNames[i],
                        hostName: hostNames[i],
                        lessonImage: lessonIcons[i],
                        hostIcon: hostIcons[i],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
