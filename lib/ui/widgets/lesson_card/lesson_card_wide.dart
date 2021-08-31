import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:subero_mobile/data/model/lesson_model.dart';


import 'package:subero_mobile/routes/routes.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class LessonCardWide extends StatelessWidget {

  final double width; // カードの幅
  final LessonModel lesson;

  LessonCardWide(this.lesson, {this.width: 400}); // 幅の初期設定は適当

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.LESSON_DETAILS, parameters: {'lessonId': this.lesson.lessonId}),
      child: SizedBox(
        width: width,
        height: 110,
        child: Card(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAliasWithSaveLayer, // カードの角丸
          child: Container(
            child: Row(
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.only(bottom: 3),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 1, color: Colors.grey.shade300),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(lesson.lessonImage),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 8, 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.lessonName,
                          style: TextStyle(fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(lesson.lessonDescription, style: TextStyle(fontSize: 14)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            _hostName(),
                            Container(
                              child: Text(
                                lesson.price.toString() + '円',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _hostName() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.USER_PAGE, parameters: {'userId': lesson.hostId}),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: NetworkCircleImage(15, imageUrl: lesson.hostIcon, width: 1, color: Colors.grey.shade500),
            width: 15,
            height: 15,
          ),
          Text(lesson.hostName, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
