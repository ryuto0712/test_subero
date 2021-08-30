import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_card/lesson_card_controller.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class ContractingLessons extends StatelessWidget {
  final LessonCardController lc = Get.put(LessonCardController(LessonRepository(lessonProvider: LessonProvider())));
  final List<String> lessonIds = [
    'sample_1',
    'sample_1',
  ];

  @override
  Widget build(BuildContext context) {
    lc.getLessons(lessonIds);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text('契約中のレッスン'),
        ),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() => Row(
                  children: [
                    for (int i = 0; i < lc.lessons.length; i++) LessonCardSmall(lc.lessons[i]),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
