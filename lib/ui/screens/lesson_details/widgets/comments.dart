import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/data/model/comment_model.dart';
import 'package:subero_mobile/controller/lesson_details/lesson_details_controller.dart';
import 'comment.dart';

class Comments extends StatelessWidget {
  final LessonDetailsController c = Get.find<LessonDetailsController>();
  final TextEditingController textEditingController = TextEditingController(); // 入力フォーム用コントローラ

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
      return Container(
        margin: EdgeInsets.fromLTRB(30, 12, 30, 0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) => comment = text,
              controller: textEditingController,
              maxLines: null, // 折り返しの設定
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                c.addComment(comment),
                textEditingController.clear(),
              },
              child: Text('送信'),
            )
          ],
        ),
      );
  }
}
