import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/data/model/comment_model.dart';
import 'package:subero_mobile/controller/lesson_details/lesson_details_controller.dart';
import 'comment.dart';

class Comments extends StatelessWidget {
  final LessonDetailsController c = Get.find<LessonDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 50),
          margin: EdgeInsets.only(bottom: 5),
          child: Text('コメント', style: TextStyle(fontSize: 13)),
        ),
        Obx(() => commentBuilder(c.lesson.comments)),
        Obx(() => addComment()),
      ],
    ));
  }

  commentBuilder(List<CommentModel> comments) {
    return Container(
      child: Column(
        children: [for (int i = 0; i < comments.length; i++) Comment(comment: comments[i])],
      ),
    );
  }

  addComment() {
    late String comment;
    if (c.doComment.value == false)
      return Center(
        child: ElevatedButton(
          onPressed: () => c.toggleDoComment(),
          child: Text('コメントする'),
        ),
      );
    else
      return Column(
        children: [
          TextField(
            onChanged: (text) => comment = text,
          ),
          ElevatedButton(
            onPressed: () => c.addComment(
              'sample_1',
              'Izuru Kambayashi',
              'images/icon_sample.png',
              comment,
            ),
            child: Text('送信'),
          )
        ],
      );
  }
}
