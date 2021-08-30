import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/comment_widget/comment_widget_controller.dart';
import 'package:subero_mobile/data/model/comment_model.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

// TODO: 画面サイズに合わせた幅の調整

class Comment extends StatelessWidget {
  final CommentModel comment;
  Comment({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(top: 12),
            child: NetworkCircleImage(40, imageUrl: comment.userIcon),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12, bottom: 2),
                  child: Text(comment.userName, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                ),
                Container(
                    // padding: EdgeInsets.all(10),
                    // color: Colors.grey.shade400,
                    child: Bubble(comment.contents, fromAtNow(comment.createdAt!)))
              ],
            ),
          )
        ],
      ),
    );
  }
}

// 現在の時刻からの差を表示
String fromAtNow(DateTime date) {
  final Duration difference = DateTime.now().difference(date);
  final int sec = difference.inSeconds;

  if (sec >= 60 * 60 * 24) {
    return '${difference.inDays.toString()}日前';
  } else if (sec >= 60 * 60) {
    return '${difference.inHours.toString()}時間前';
  } else if (sec >= 60) {
    return '${difference.inMinutes.toString()}分前';
  } else {
    return '$sec秒前';
  }
}

// メッセージの送信履歴を表示
class CommentBuilder extends StatelessWidget {
  final List<CommentModel?> comments;
  CommentBuilder(this.comments);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [for (int i = 0; i < comments.length; i++) Comment(comment: comments[i]!)],
      ),
    );
  }
}

// コメントするボタン＋送信フォーム
class AddComment extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController(); // 入力フォーム用コントローラ
  final CommentWidgetController c = Get.put(CommentWidgetController());
  final Function onSubmit;
  AddComment({required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    late String comment;
    return Obx(
      () => (c.doComment == false)
          ? Center(
              child: ElevatedButton(
                onPressed: () => c.toggleDoComment(),
                child: Text('コメントする'),
              ),
            )
          : Container(
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
                      onSubmit(comment),
                      // c.addComment(comment),
                      textEditingController.clear(),
                    },
                    child: Text('送信'),
                  ),
                ],
              ),
            ),
    );
  }
}
