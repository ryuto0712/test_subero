import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_details/lesson_details_controller.dart';

class PlaceDatePrice extends StatelessWidget {
  final LessonDetailsController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: Colors.red.shade400,
                    size: 25,
                  ),
                  Obx(() => Text(c.lesson.skiResort))
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.blue.shade400,
                    size: 25,
                  ),
                  Obx(() => Text(c.lesson.date))
                ],
              ),
            ],
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Obx(() => Text(
                  '¥' + c.lesson.price.toString() + '円',
                  style: TextStyle(fontSize: 20),
                )),
            Obx(() => Text(
                  '/' + c.lesson.lessonDuration.toString() + '時間',
                  style: TextStyle(fontSize: 15),
                )),
          ])
        ],
      ),
    );
  }
}
