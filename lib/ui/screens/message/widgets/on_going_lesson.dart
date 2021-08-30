import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:subero_mobile/controller/message/messege_contents_controller.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/routes/app_routes.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class OnGoingLesson extends StatelessWidget {
  final MessageContentsController c = Get.find<MessageContentsController>();

  @override
  Widget build(BuildContext context) {
    c.getOnGoingLessons();
    return Column(
      children: [
        Container(
          height: 30,
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1))),
        ),
        Obx(
          () => Column(
            children: [
              for (int i = 0; i < c.onGoingLessons.length; i++) lessonList(c.onGoingLessons[i]),
            ],
          ),
        ),
        // Row(
        //   // なぜかこれをなくすとエラーになる
        //   children: <Widget>[
        //     Expanded(
        //       child: SizedBox(
        //         // height: 400.0,
        //         child:
        //         // child: Obx(
        //         //   () => ListView.builder(
        //         //     scrollDirection: Axis.vertical,
        //         //     itemCount: c.onGoingLessons.length,
        //         //     itemBuilder: (BuildContext context, int index) {
        //         //       return lessonList(c.onGoingLessons[index]);
        //         //     },
        //         //   ),
        //         // ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget lessonList(LessonModel lesson) {
    // return Text('sample');
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.INDIVIDUAL_MESSAGE, parameters: {'messagesId': 'sample_message'}),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(lesson.lessonImage),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(lesson.lessonName, style: TextStyle(fontSize: 18), maxLines: 1, overflow: TextOverflow.ellipsis),
                    Row(
                      children: <Widget>[
                        Container(
                          child: NetworkCircleImage(20, imageUrl: lesson.hostIcon),
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Text(lesson.hostName, style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
