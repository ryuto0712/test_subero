import 'package:flutter/material.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

import 'index.dart';

class LessonContents extends StatelessWidget {
  const LessonContents({
    required this.lessonName,
    required this.skiResort,
    required this.price,
    required this.lessonDuration,
    required this.date,
    required this.tagNames,
    required this.lessonDescription,
    required this.comments,
    required this.userNames,
    required this.userIcons,
  });

  final String lessonName;
  final String lessonDescription;
  final String skiResort;
  final String date; // 開催日時, TODO: TimeStampに変更
  final int price;
  final num lessonDuration; // レッスンの時間
  final List<String> tagNames;
  final List<String> comments;
  final List<String> userNames;
  final List<String> userIcons;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: Colors.grey, width: 1),
        )),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            // Image.asset('images/lesson_detail_top.png'),
            LessonTitle(lessonName),
            ClickableTagGenerator(tagNames),

            // Image.asset('images/lesson_detail_middle.png'),
            PlaceDatePrice(place: skiResort, date: date, price: price, lessonDuration: lessonDuration),
            LessonDescription(lessonDescription),
            Comments(comments, userNames, userIcons),
          ],
        ),
      ),
    );
  }
}
