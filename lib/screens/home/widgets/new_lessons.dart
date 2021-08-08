import 'package:flutter/material.dart';
import 'package:subero_mobile/widgets/index.dart';

class NewLessons extends StatelessWidget {
  final double width;
  NewLessons(this.width);

  final List<String> lessonNames = [
    '【初心者におすすめ】グラトリ入門レッスン',
  ];
  final List<String> hostNames = [
    'toichi shogo',
  ];
  final List<String> lessonIcons = [
    'images/app_icon.png',
  ];
  final List<String> hostIcons = [
    'images/icon_sample.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
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
        LessonCardMedium(lessonNames[0], hostNames[0], lessonIcons[0], hostIcons[0], width / 2),
        LessonCardMedium(lessonNames[0], hostNames[0], lessonIcons[0], hostIcons[0], width / 2),
      ],
    );
  }
}
