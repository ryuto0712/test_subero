import 'package:flutter/material.dart';
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
    'images/raimbow.png',
    'images/raimbow.png',
    'images/raimbow.png',
    'images/raimbow.png',
    'images/raimbow.png',
    'images/raimbow.png',
  ];
  final List<String> hostIcons = [
    'images/icon_sample.png',
    'images/icon_sample.png',
    'images/icon_sample.png',
    'images/icon_sample.png',
    'images/icon_sample.png',
    'images/icon_sample.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(area + 'のレッスン'),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (int i = 0; i < lessonNames.length; i++)
                    LessonCardSmall(
                      lessonNames[i],
                      hostNames[i],
                      lessonIcons[i],
                      hostIcons[i],
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
