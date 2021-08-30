import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';

import 'package:subero_mobile/routes/routes.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class LessonCardSmall extends StatelessWidget {
  LessonCardSmall(this.lesson);
  final LessonModel lesson;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.LESSON_DETAILS, parameters: {'lessonId': lesson.lessonId}),
      child: Card(
        margin: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        clipBehavior: Clip.antiAliasWithSaveLayer, // カードの角丸
        child: Container(
          width: 120,
          height: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 100,
                  margin: EdgeInsets.only(bottom: 3),
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(lesson.lessonImage),
                      ))),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  lesson.lessonName,
                  style: TextStyle(fontSize: 10.5),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.USER_PAGE, parameters: {'userId': lesson.hostId}),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: NetworkCircleImage(15, imageUrl: lesson.hostIcon),
                        width: 15,
                        height: 15,
                      ),
                      Text(lesson.hostName, style: TextStyle(fontSize: 9)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
