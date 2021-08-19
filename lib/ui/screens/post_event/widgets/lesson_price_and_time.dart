import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_post/lesson_post_controller.dart';

// TODO: ～時間じゃなくて～分に変更？（もしくは時間の入力をテキスト入力ではなく選択式にする）

class LessonPriceAndTime extends StatelessWidget {
  final LessonPostController c = Get.find();
  LessonPriceAndTime();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            width: 100,
            child: TextField(
              onChanged: (price) => c.lesson.price = int.parse(price),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          Text('円'),
          Text('/'),
          SizedBox(
            width: 30,
            child: TextField(
              onChanged: (lessonDuration) =>
                  c.lesson.lessonDuration = double.parse(lessonDuration),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          Text('時間'),
        ],
      ),
    );
  }
}
