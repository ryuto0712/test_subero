import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_details/lesson_details_controller.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class Comments extends StatelessWidget {
  final LessonDetailsController c = Get.find<LessonDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 50),
              margin: EdgeInsets.only(bottom: 5),
              child: Text('コメント', style: TextStyle(fontSize: 13)),
            ),
            CommentBuilder(c.lesson.comments),
            AddComment(onSubmit: addComment),
          ],
        ),
      ),
    );
  }

  addComment(String contents) => c.addComment(contents);
}
